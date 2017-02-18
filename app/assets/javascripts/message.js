$(function() {
  function buildHTML(message) {
    var insertImage = '';
    if (message.image) {
      var insertImage =`
      <br>
      <img class="chat-message__image" src="${message.image}">
      `;
    }
    var html = `
     <li class="chat-message"> +
       <p class="chat-message__name"> message.name </p>
       <p class="chat-message__time"> message.time </p>
       <p class="chat-message__body"> message.body </p>
       insertImage
     </li>`;
      return html;
    }

    function autoScroll() {
      $('.chat-body').scrollTop( $('.chat-messages').height());
    }

    $('.chat-footer__body__image').on('change', function() {
      $('#new_message').submit();
    });
    var form = $('#new_message')

    autoScroll();
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
      $this.get(0).reset();
      autoScroll();
    })
    .fail(function() {
      alert('error');
    });
    return false;
});

      setInterval(reload, 1000)
      function reload (){
        $.ajax({
          type: 'GET',
          url: form.attr('action'),
          dataType: 'json'
        })
        .done(function(message){
          $('.chat-message').remove();
          messages.forEach(function(message){
            insertHTML += buildHTML(message);
          });
          $('.chat-messages').append(insertHTML)
        });
       };
      });
