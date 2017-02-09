$(function() {
  function buildHTML(message) {
    var user_name = $('<p class = "chat-message__name">').append(message.name);
    var message_time = $('<p class = "chat-message__time">').append(message.time);
    var message_body = $('<p class = "chat-message__body">').append(message.body);
    var html = $('<li class = "chat-message">').append(user_name, message_time, message_body);
    return html;
  }

  $('.chat-footer').on('submit', function(e) {
    e.preventDefault();

    var form = $('.new_message');

    var textField = $('#message_body');
    var message = textField.val();

    $.ajax({
      type: form.attr('method'),
      url: form.attr('action'),
      data: {
        message: {
          body: message
        }
      },
      dataType: 'json'
    })

    .done(function(data) {
      var html = buildHTML(data.message);
      $('.messages').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});