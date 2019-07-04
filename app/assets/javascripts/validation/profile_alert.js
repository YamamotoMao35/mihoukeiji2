$(function(){
  var pageUrl = $(location).attr('pathname');
  if (pageUrl == "/users/1/profiles"){
    var text_max = 150; // 最大入力値
    $(".count").text(text_max - $("#self_introduction").val().length);

    $("#self_introduction").on("keydown keyup keypress change",function(){
      var text_length = $(this).val().length;
      var countdown = text_max - text_length;
      $(".count").text(countdown);
      if(countdown < 0){
        $('.count').css({
            color:'#e72510',
            fontWeight:'bold'
        });
      } else {
        $('.count').css({
            color:'#000000',
            fontWeight:'normal'
        });
      }
    });
    $("#profile-submit").click(function(){
      var self_introduction = $("textarea[name='profile[self_introduction]']").val()
      if(self_introduction.length > 150){
        alert("150文字以内で再記入お願いします");
      }
    })
  } else if (pageUrl.match(/\/boards\/\d/)){
    $(".respond-btn").click(function(){
      var message_body = $("textarea[name='body']").val();
      if(message_body.length > 1000){
        alert("1000文字以内で再記入お願いします");
      }
    })
  } else if (pageUrl == "/boards/new"){
    $(".thread-new-btn").click(function(){
      var thread_title = $("input[name='board[title]']").val();
      var thread_description = $("textarea[name='board[description]']").val();
      console.log(thread_title)
      if (thread_title.length > 60){
        alert("60文字以内で再記入お願いします");
      }
      else if (thread_description.length > 1000){
        alert("1000文字以内で再記入お願いします");
      }
      else{
        console.log("OK");
      }
    })
  }
  else{
  }
})