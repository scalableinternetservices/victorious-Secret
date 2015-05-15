$(document).ready(function(){

 $('#search-results').bind('DOMNodeInserted DOMNodeRemoved', function(event) {
          if (event.type == 'DOMNodeInserted') {
		         $('.start-conversation').click(function (e) {
		        e.preventDefault();

		        var sender_id = $(this).data('sid');
		        var recipient_id = $(this).data('rip');
		        if(sender_id == recipient_id)
		        {
		        	alert('how are you gonna chat with youself?');
		        	return false;
		        }

		        $.post("/conversations", { sender_id: sender_id, recipient_id: recipient_id }, function (data) {
		            chatBox.chatWith(data.conversation_id);
		        });
		        console.log('just sent a request');
   			 });
          }
      });

});