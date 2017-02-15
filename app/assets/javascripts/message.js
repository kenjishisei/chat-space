$(function() {
  function buildHTML(message) {
    var html =
    '<li class="chat-message">' +
      '<p class="chat-message__name">' +
          message.name +
      '</p>' +
      '<p class="chat-message__time">' +
          message.time +
      '</p>' +
      '<p class="chat-message__body">' +
          message.body +
      '</p>' +
      '<br>' +
      '<img class="chat-message__image">' +
          message.image +
      '</img>' +
    '</li>'
      return html;
    }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();

    var $this = $(this);
    var form = $('.new_message');

    var fd = new FormData($this.get(0));

    $.ajax({
      type: form.attr('method'),
      url: form.attr('action'),
      data: fd,
      contentType : false,
      processData : false,
      dataType: 'json'
    })

    .done(function(data) {
      var html = buildHTML(data.message);
      $('.messages').append(html);
      $this.val('');
      scrollToBottom();
    })
    .fail(function() {
      alert('error');
    });
  });
});
