/**
* File: userController.cfc
* Author: Satyapriya Baral
* Path: model/userController.cfc
* Purpose: contains functions for login and registration.
* Date: 01-05-2017
*/
component {
	
	userObject = CreateObject("component", "model.userModel");
	error = CreateObject("component", "log.error");
	/**
    * Function to check fields and register user.
    *
    * @param string $username - contains name of the user.
    * @param string $email - contains email of the user.
    * @param string $password - contains passwoed of the user.
    * @param string $address - contains address of the user.
    * @param string $number - contains number of the user.
    * @return - Returns messages of errors if any or success msg.
    */
	public any function registerUser(string username, string email, string password, string retypePassword, string address, string number)
	{
		try {
			LOCAL.errorMessages=StructNew();
			if (Len(username) < 5) {
				LOCAL.errorMessages.Name = 'Name Should be of minimum 5 charecters';
			}
			if (email EQ '' OR NOT isValid("email", email)) {
			LOCAL.errorMessages.Email = 'Plese Enter a Valid Email';
			}
			if (Len(password) < 5) {
				LOCAL.errorMessages.Password = 'Password Should be of minimum 5 charecters';
			}
			else if (password NOT EQUAL retypePassword) {
				LOCAL.errorMessages.RetypePassword = 'Password Mismatch';
			}
			if (Len(number) LESS THAN 10 OR Len(number) GREATER THAN 10) {
				LOCAL.errorMessages.Number = 'Number should be of 10 digits';
			}
			if (isDefined("errorMessages") AND NOT structIsEmpty(errorMessages)) {
				return LOCAL.errorMessages;
			}
			var LOCAL.checkUser = userObject.checkUser(email);
			if (checkUser.getResult().recordCount NEQ 0 ) {
				LOCAL.errorMessages.emailExists = 'Email Already Exists';
				return LOCAL.errorMessages;
			} else {
				var LOCAL.isRegistered = userObject.createUser(username, email, password, address, number);
				LOCAL.errorMessages.succesful = 'Registered Succesfully';
				location("../Views/login.cfm");
			}
		return errorMessages;
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}
	
	/**
    * Function to check user details entered and login user.
    *
    * @param string $email - contains email of the user.
    * @param string $password - contains passwoed of the user.
    * @return - Returns to the homepage or returns error.
    */
	public any function loginUser(string email, string password)
	{

		try {
			LOCAL.loginErrorMessages=StructNew();
			if (email EQ '' OR NOT isValid("email", email)) {
				LOCAL.loginErrorMessages.Email = 'Plese Enter a Valid Email';
			}
			if (Len(password) < 5) {
				LOCAL.loginErrorMessages.Password = 'Password Should be of minimum 5 charecters';
			}
			if (isDefined("loginErrorMessages") AND NOT structIsEmpty(loginErrorMessages)) {
				return LOCAL.loginErrorMessages;
			}
			var LOCAL.hashPassword = HASH(ARGUMENTS.password);
			var LOCAL.isLogged = userObject.checkUser(email);
			if(LOCAL.isLogged.getResult().recordCount EQ 0) {
				LOCAL.loginErrorMessages.user = 'Incorrect Email or Password';
				return LOCAL.loginErrorMessages;
				location("../Views/login.cfm");
			} else {
				if(LOCAL.isLogged.getResult().Password NEQ LOCAL.hashPassword) {
					LOCAL.loginErrorMessages.user = 'Incorrect Password';
					return LOCAL.loginErrorMessages;
				} else {
					var SESSION.isLogged = "true";
					var SESSION.userEmail = "#arguments.email#";
					var SESSION.user = "#isLogged.getResult().Name#";
					APPLICATION.currentUsers = listAppend(APPLICATION.currentUsers, #ARGUMENTS.email#);
					location(url="../Views/home.cfm" addToken="false");
				}	
			}
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}
	
	/**
    * Function to get the user Details.
    *
    * @param string $email - contains email of the user.
    * @return - Returns userinfo details.
    */
	public any function userDetails(string email)
	{
		try {
			var LOCAL.userInfo = userObject.checkUser(email);
			return LOCAL.userInfo;
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}
	
	/**
    * Function to signout the user.
    *
    * @param null
    * @return null
    */
	public void function signoutUser()
	{
		try {
			if(SESSION.userEmail NEQ "") {
				APPLICATION.currentUsers = listDeleteAt(APPLICATION.currentUsers,listFind(APPLICATION.currentUsers, SESSION.userEmail));
			}
			structClear(SESSION);
			var SESSION.isLogged = "false";
			var SESSION.userEmail = "";
			location(url="../Views/login.cfm", addToken="false");
			sessionInvalidate();
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}
}