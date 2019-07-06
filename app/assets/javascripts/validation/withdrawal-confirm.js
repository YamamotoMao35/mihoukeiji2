$(function(){
  var pageUrl = $(location).attr('pathname');
  if (pageUrl.match(/\/users\/\d+\/withdrawal/)){
    $(".btn-withdrawal").click(function(){
      var result = window.confirm("削除してよろしいでしょうか?");
      if(result != true){
        return false;
      }
    })
  }
})