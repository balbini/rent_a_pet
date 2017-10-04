// The messageForm(); handles clearing out the form upon enter.

function messageForm(){
  var shiftDown = false;
  // creating the #new_message tag
  var chatForm = $("#new_message");
  // for the $("#new_message"); put a children called "textarea" which is where users will type
  var messageBox = chatForm.children("textarea");

  // when  the key code is 13 which is enter and if the messageBox is in focus and the shift is NOT down then prevent a new line (if shift and enter is pressed then put in a new line). Otherwise submit the form on pressing enter and then reset it
  $(document).keypress(function (e) {
      if(e.keyCode == 13) {
          if(messageBox.is(":focus") && !shiftDown) {
           e.preventDefault(); // prevent another \n from being entered
      chatForm.submit();
      $(chatForm).trigger('reset');
          }
      }
  });
$(document).keydown(function (e) {
      if(e.keyCode == 16) shiftDown = true;
  });
$(document).keyup(function (e) {
      if(e.keyCode == 16) shiftDown = false;
  });
}
