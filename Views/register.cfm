<!DOCTYPE html>
<!--
* File: register.cfm
* Author: Satyapriya Baral
* Purpose: contains the view of the register page.
* Date: 01-05-2017
-->
<html lang = "en-US">
	<head>
		<link rel="stylesheet" href="../assets/template/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="../assets/template/dist/css/AdminLTE.min.css">
		<link rel="stylesheet" href="../assets/custom/css/main.css?ver=1.367">
	</head>	
	<body class="hold-transition login-page">
		<cfset controllerObject = CreateObject("component","controller.userController") />
		<cfif StructKeyExists(form,"registerbtn")>
			<cfset VARIABLES.errorMessages = controllerObject.registerUser( username = "#form.Name#", 
			email = "#form.Email#", password = "#form.Password#",  retypePassword = "#form.RetypePassword#", 
			address = "#form.Address#", number = "#form.Number#" )>
		</cfif>
		<div class="login-box">
			<div class="login-logo">
				<b>REGISTER</b>
			</div>
			<div class="login-box-body">
				<p class="login-box-msg">Sign in to start your session</p>
				<cfif  SESSION.isLogged NEQ "false">
					<cflocation url="../Views/home.cfm" addToken="false"></cflocation>
				</cfif>
				<cfif isDefined("errorMessages.emailExists")>
					<cfoutput> #errorMessages.emailExists# </cfoutput>
				</cfif>
				<cfif isDefined("errorMessages.succesful")>
					<cfoutput> #errorMessages.succesful# </cfoutput>
				</cfif>
				<cfform id="registerUser">
					<div class="form-group has-feedback">
						<cfinput type="text" class="form-control" placeholder="Full name" name="Name">
						<span class="glyphicon glyphicon-user form-control-feedback"></span>
						<cfif isDefined("errorMessages.Name")>
							<cfoutput> #errorMessages.Name# </cfoutput>
						</cfif>
					</div>
					<div class="form-group has-feedback">
						<cfinput type="email" class="form-control" placeholder="Email" name="Email">
						<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
						<cfif isDefined("errorMessages.Email")>
							<cfoutput> #errorMessages.Email# </cfoutput>
						</cfif>
					</div>
					<div class="form-group has-feedback">
						<cfinput type="password" class="form-control" placeholder="Password" name="Password" >
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						<cfif isDefined("errorMessages.Password")>
							<cfoutput> #errorMessages.Password# </cfoutput>
						</cfif>
					</div>
					<div class="form-group has-feedback">
						<cfinput type="password" class="form-control" placeholder="Retype password" name="RetypePassword">
						<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
						<cfif isDefined("errorMessages.RetypePassword")>
							<cfoutput> #errorMessages.RetypePassword# </cfoutput>
						</cfif>
					</div>
					<div class="form-group has-feedback">
						<cfinput type="text" class="form-control" placeholder="Address" name="Address">
						<span class="glyphicon glyphicon-home form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<cfinput type="number" class="form-control" placeholder="Number" name="Number">
						<span class="glyphicon glyphicon-phone-alt form-control-feedback"></span>
						<cfif isDefined("errorMessages.number")>
							<cfoutput> #errorMessages.number# </cfoutput>
						</cfif>
					</div>
					<div class="row">
						<div class="col-xs-8"></div>
						<div class="col-xs-4">
							<button type="submit" name="registerbtn" class="btn btn-primary btn-block btn-flat">Register</button>
						</div>
					</div>
				</cfform>
				<a href="../Views/login.cfm" class="text-center">I already have a membership</a>
			</div>
		</div>
		<script src="../assets/template/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="../assets/template/js/jquery-validation-1.16.0/dist/jquery.validate.js"></script>
		<script src="../assets/custom/js/script.js?ver=1265367"></script>
		<script src="../assets/template/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>