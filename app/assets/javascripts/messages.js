// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// app/assets/javascripts/messages.js
window.updateMessagesViaJSON = function(messagesUrl) {
  console.log("inside updateMessagesViaJSON");
  $.getJSON(messagesUrl, function(messages) {
    $('.messages').html('');
    messages.forEach(function(message) {
      $('.messages').append("<p><strong>" + message.username  + "</strong>:"  + message.content + "</p>");
    });
  })
}

