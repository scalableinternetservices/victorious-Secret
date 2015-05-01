	$(document).ready(function(){
		if(window.location.pathname == "/users/sign_in"){
			$(".header").hide();
		} 
		$( ".loginbtn" ).click(function() {
		  $("#popup").modal('show');
		});
		$( ".signupbtn" ).click(function() {
		  $("#popuptwo").modal('show');
		});
	});