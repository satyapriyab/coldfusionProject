$(document).ready(function(){
	$("#registerUser").validate({
		rules: {
			Name: {
				required: true,
				minlength: 5
			},
			Email: {
				required: true,
				email: true
			},
			Password: {
				required: true,
				minlength: 5
			},
			RetypePassword: {
				required: true,
				equalTo: Password
			},
			Number: {
				required: true,
				minlength: 10,
				maxlength: 10
			}
		},
		messages: {
			Name: {
				required: "Please enter name",
				minlength: "Name should be of minimum 5 charecters"
			},
			Email: {
				required: "Please enter Email",
				email: "Enter a valid Email"
			},
			Password: {
				required: "Please enter Password",
				minlength: "Password should be of minimum 5 charecters"
			},
			RetypePassword: {
				required: "Reenter Password",
				equalTo: "Password Mismatch"
			},
			Number: {
				required: "Please Enter Number",
				minlength: "Please Enter 10 digits",
				maxlength: "Please Enter 10 digits"
			}
		}
	});
	
	$("#loginUser").validate({
		rules: {
			Email: {
				required: true,
				email: true
			},
			Password: {
				required: true,
				minlength: 5
			}
		},
		messages: {
			Email: {
				required: "Please enter Email",
				email: "Enter a valid Email"
			},
			Password: {
				required: "Please enter Password",
				minlength: "Password should be of minimum 5 charecters"
			}
		}
	});
});