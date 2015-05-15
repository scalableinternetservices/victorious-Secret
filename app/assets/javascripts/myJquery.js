var chatboxFocus = new Array();
var chatBoxes = new Array();
var collapseMyMenu, expandMyMenu, hideMenuTexts, showMenuTexts;
	
	$(document).ready(function(){


    $(".provider_rating").each(function() {
        // Get the value
        var val = parseFloat($(".provider_rating").html());
        // Make sure that the value is in 0 - 5 range, multiply to get width
        var size = Math.max(0, (Math.min(5, val))) * 16;
        // Create stars holder
        var $span = $('<span />').width(size);
        // Replace the numerical value with stars
        $(".provider_rating").html($span);
    });

    $(".consumer_rating").each(function() {
        // Get the value
        var val = parseFloat($(".consumer_rating").html());
        // Make sure that the value is in 0 - 5 range, multiply to get width
        var size = Math.max(0, (Math.min(5, val))) * 16;
        // Create stars holder
        var $span = $('<span />').width(size);
        // Replace the numerical value with stars
        $(".consumer_rating").html($span);
    });

		$("#justify-icon").click(function(e) {
      if ($(this).parent("nav.sidebar").hasClass("sidebar-menu-collapsed")) {
        expandMyMenu();
        $("#chatsearch").removeClass('hide');
        showMenuTexts();
        $(this).css({
          color: "#000"
        });
      } else if ($(this).parent("nav.sidebar").hasClass("sidebar-menu-expanded")) {
      	$("#chatsearch").addClass('hide');
        collapseMyMenu();
        hideMenuTexts();
        $(this).css({
          color: "#FFF"
        });
      }
      return false;
    });
		$( ".loginbtn" ).click(function() {
		  $("#popup").modal('show');
		});
		
		$( ".signupbtn" ).click(function() {
		  $("#popuptwo").modal('show');
		});

		$( ".postmodal_link" ).click(function() {
		  $("#popupthree").modal();
		});

		$( ".bidmodal_link" ).click(function() {
		  $("#popupfour").modal();
		});




        $(".alert-success").delay(2000).fadeOut("slow");
        $(".alert-danger").delay(4000).fadeOut("slow");

     
    /**google maps **/
    /**$("#post-submit").submit(map_initialize());**/
         
		/**
     * When the send message link on our home page is clicked
     * send an ajax request to our rails app with the sender_id and
     * recipient_id
     */
		
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
    document.getElementById("wavegif").playbackRate = 3.0;
});

$(window).scroll(function() {   
		if($(window).scrollTop() + $(window).height() == $(document).height()) {
			$(".footer").css("display","block");
		}
		else {
			$(".footer").css("display","none");
			$(".footer").css("color","white");
		}
});


expandMyMenu = function() {
  return $("nav.sidebar").removeClass("sidebar-menu-collapsed").addClass("sidebar-menu-expanded");
};
collapseMyMenu = function() {
  return $("nav.sidebar").removeClass("sidebar-menu-expanded").addClass("sidebar-menu-collapsed");
};
showMenuTexts = function() {
  return $("nav.sidebar ul a span.expanded-element").show();
};
hideMenuTexts = function() {
  return $("nav.sidebar ul a span.expanded-element").hide();
};
