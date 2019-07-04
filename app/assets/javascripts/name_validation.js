$(function(){
  var pageUrl = $(location).attr('pathname');
  if (pageUrl.match(/\/boards\/\d/)){
    $(".respond-btn").click(function(){
      var message_name = $("input[name='name']").val();
      if(message_name.length > 10){
        alert("10文字以内で再記入お願いします");
      }
    })
  }
  else if (pageUrl.match(/\/users\/\d+\/edit/)){
    $(".user-edit-btn").click(function(){
      var user_name = $("input[name='user[name]']").val();
      if(user_name.length > 10){
        alert("10文字以内で再記入お願いします");
      }
    })
  }
  else{
  }
})