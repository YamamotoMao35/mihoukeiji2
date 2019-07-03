$(function(){
  window.onload = function() {
    setInterval(function() {
      var dd = new Date();
      document.getElementById("RealtimeClockArea").innerHTML = dd.toLocaleString();
    }, 200);
  }
})