	$(document).ready(function(){
		$( ".postmodal_link" ).click(function() {
		  $("#popupthree").modal();
		});
		
		document.getElementById("wavegif").playbackRate = 3.0;
		
		$('a[href^="#"]').on('click',function (e) {
		    e.preventDefault();
		    var target = this.hash;
		    var $target = $(target);
		    $('html, body').stop().animate({
		        'scrollTop': $target.offset().top
		    }, 900, 'swing', function () {
		        window.location.hash = target;
		    });
		});

		$( ".loginbtn" ).click(function() {
		  $("#popup").modal('show');
		});
		
		$( ".signupbtn" ).click(function() {
		  $("#popuptwo").modal('show');
		});
});