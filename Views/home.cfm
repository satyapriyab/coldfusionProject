<!DOCTYPE html>
<!--
* File: home.cfm
* Author: Satyapriya Baral
* Purpose: contains the view of the user home page.
* Date: 01-05-2017
-->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home</title>
    <link href="../assets/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/template/dist/css/freelancer.min.css" rel="stylesheet">
    <link href="../assets/template/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="../assets/custom/css/main.css?ver=1.34367">
</head>

<body id="page-top" class="index">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

	<cfif  SESSION.isLogged EQ "false">
		<cflocation url="../Views/login.cfm" addToken="false"></cflocation>
	</cfif>
	<cfset controllerObject = CreateObject("component","controller.userController") />
	<cfif StructKeyExists(form,"signoutbtn")>
		<cfset VARIABLES.signout = controllerObject.signoutUser()/>
	</cfif>
	<cfset VARIABLES.userDetails = controllerObject.UserDetails(SESSION.userEmail)/>
    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">Home</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#profile">Profile</a>
                    </li>
                    <li class="page-scroll">
						<cfform>
							<button type = "submit" class = "btnlink" name = "signoutbtn" id = "signoutbtn" >
								<span class = "glyphicon glyphicon-log-out"></span> SIGNOUT
							</button>
						</cfform>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <header>
        <div class="container" id="maincontent" tabindex="-1">
            <div class="row">
                <div class="col-lg-12">
                    <img class="img-responsive" src="../assets/template/dist/img/profile.png" alt="">
                    <div class="intro-text">
                        <h1 class="name">Hi</h1>
						<cfoutput> #SESSION.user# </cfoutput>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <section id="profile">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Profile</h2>
                    <hr class="star-primary">
                </div>
					Name : <cfoutput>#VARIABLES.userDetails.getResult().Name#</cfoutput></br>
					Email : <cfoutput>#VARIABLES.userDetails.getResult().Email#</cfoutput></br>
					Address : <cfoutput>#VARIABLES.userDetails.getResult().Address#</cfoutput></br>
					Contact : <cfoutput>#VARIABLES.userDetails.getResult().Number#</cfoutput>
            </div>
        </div>
    </section>
    <script src="../assets/template/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/template/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="../assets/template/dist/js/jqBootstrapValidation.js"></script>
    <script src="../assets/template/dist/js/contact_me.js"></script>
    <script src="../assets/template/dist/js/freelancer.min.js"></script>
</body>

</html>