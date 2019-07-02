$(function(){
  var text_max = 120; // 最大入力値
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
    if(self_introduction.length > 120){
      alert("120文字以内で再記入お願いします");
    }
  })
})