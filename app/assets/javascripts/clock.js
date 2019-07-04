$(function(){
  window.onload = function() {
    setInterval(function() {
      var dd = new Date();
      var pageUrl = $(location).attr('pathname');
      if (pageUrl == "/" || pageUrl == "/search/index"){
        document.getElementById("RealtimeClockArea").innerHTML = dd.toLocaleString();
      }
      else{
        clearInterval();
      }
    }, 200);
  }
})