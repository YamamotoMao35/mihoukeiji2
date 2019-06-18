$(function(){
  $("#angle-up").on('click', function(){
    $('html, body').animate({scrollTop: 0});
  })
  $("#angle-down").on('click', function(){
    var a = document.documentElement;
    var y = a.scrollHeight - a.clientHeight;
    $('html, body').animate({scrollTop: y});
  })
})