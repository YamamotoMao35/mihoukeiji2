$(function(){
  $('#toc').toc({
    'selectors': '.help-page h2, .help-page h3, .help-page h4, .help-page h5, .help-page h6', //目次として表示する要素のCSSセレクターを指定
    'highlightOffset': 0,
    'highlightOnScroll': true,
    'anchorName': function(i, heading, prefix) {
      return prefix+i;
    }
  });
});