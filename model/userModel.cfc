/**
* File: userModel.cfc
* Author: Satyapriya Baral
* Path: model/userModel.cfc
* Purpose: contains functions to connect to the user database table.
* Date: 01-05-2017
*/
component {
	error = CreateObject("component", "log.error");
	/**
    * Function to create a record of new user registered.
    *
    * @param string $username - contains name of the user.
    * @param string $email - contains email of the user.
    * @param string $password - contains passwoed of the user.
    * @param string $address - contains address of the user.
    * @param string $number - contains number of the user.
    * @return - Returns boolian value if record created or not.
    */
	public boolean function createUser(string username, string email, string password, string address, string number)
	{
		try {
			var hashPassword = HASH(password);
			newUser = new Query();
			newUser.setSQL("INSERT into dbo.UserAccount (Name, Email, Password, Address, Number) VALUES (:username, :email, :hashPassword, :address, :number)");
			newUser.addParam( name = "username", value = "#arguments.username#", cfsqltype = "cf_sql_varchar" );
			newUser.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
			newUser.addParam( name = "hashPassword", value = "#local.hashPassword#", cfsqltype = "cf_sql_varchar" );
			newUser.addParam( name = "address", value = "#arguments.address#", cfsqltype = "cf_sql_varchar" );
			newUser.addParam( name = "number", value = "#arguments.number#", cfsqltype = "cf_sql_varchar" );
			result = newUser.execute();
			return "true";
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}
	
	/**
    * Function to check user exists or not.
    *
    * @param string $email - contains email of the user.
    * @return - Returns the record of the user.
    */
	public any function checkUser(string email)
	{
		try {
			checkUser = new Query();
			checkUser.setSQL("SELECT * FROM dbo.UserAccount WHERE Email = :email");
			checkUser.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
			userResult = checkUser.execute();
			return userResult;
		}
		
		catch (any exception){
			error.errorLog(exception);
		}
	}
}