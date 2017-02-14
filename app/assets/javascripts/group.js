$(function() {
  //ユーザー検索情報を追加していく関数
  function buildSearchedUserHTML(user) {
    var html =
      '<div class= "chat-group-user list clearfix">' +
        '<p class= "chat-group-user__name">' +
            user.name +
        '</p>' +
        '<a id="chat-group-user__add-button" user_name="'+ user.name + '"user_id"' + user.id +'">追加</a>' +
      '</div>';
      return html
 }
 //追加したユーザーを表示していく関数
 function buildAddedUserHTML(name, id) {
   var html =
    '<div class="chat-group-user clearfix">' +
      '<input type="hidden" name="group[user_ids][]" id="chat_group_user_ids_' + '"value="' + id + '">' +
      '<p class ="chat-group-user__name">' +
          name +
      '</p>' +
      '<a id="chat-group-user__delete-button">削除</a>' +
    '</div>';
  return html
 }

 //ユーザー検索
$('#user-search-form').keyup(function() {
  var word = $('#user-search-input').val();
  $(".list").remove();
  $.ajax({
    type: 'GET',
    url: '/users.json',
    data: { name: word },
    dataType: 'json'
  })

  .done(function(users) {
    if(word.length != 0){
      var insertHTML = '';

      users.forEach(function(user){
        insertHTML += buildSearchedUserHTML(user);
      });

      $('#user-search-result').append(insertHTML);
    }
  })
  .fail(function(users) {
    alert('エラーが発生しました');
  });
});
//グループメンバー追加
$('#user-search-result').on('click', '#chat-group-user__add-button',function() {
  var $this = $(this);
  var name = $this.attr('user_name');
  var id = $this.attr('user_id');
  var insertHTML = buildAddedUserHTML(name, id);
  $('#user-add-list').append(insertHTML);
  //追加したユーザーを検索結果一覧から除去
  $this.parent('group-user').remove();
});
//ユーザーをグループメンバーから削除
$('#user-add-list').on('click', '#chat-group-user__delete-button',function(){
  $(this).parent('.chat-group-user').remove();
  });
});
