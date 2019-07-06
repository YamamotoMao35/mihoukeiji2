$(function(){
  var pageUrl = $(location).attr('pathname');
  if (pageUrl.match(/\/boards\/\d+\/edit/)){
    $(".thread-update-btn").click(function(){
      var edit_thread_title = $("input[name='board[title]']").val();
      var edit_thread_description = $("textarea[name='board[description]']").val();
      if (edit_thread_title.length > 60){
        alert("60文字以内で再記入お願いします");
      }
      else if (edit_thread_description.length > 300){
        alert("300文字以内で再記入お願いします");
      }
      else{
        console.log("OK");
      }
    })
    $(".btn-destroy").click(function(){
      var result = window.confirm("削除してよろしいでしょうか?");
      if(result != true){
        return false;
      }
    })
  }
})
