$(function(){
  var textField = $("#category-form");
  var search_result = $("#category-search-result")

  function buildCategory(){
    var html = `<div class="form-group">
                  <div class="select-wrap">
                    <select class="form-control required" id="category-select" name="board[category_ids][]"><option value="">---</option>
                    </select>
                  </div>
                </div>`
    return html;
  }
  function buildCategotyOption(category){
    var categoryOption = `<option value="${category.id}">${category.name}</option>`
    return categoryOption;
  }

  function appendErrMsgToHTML(msg){
    var html = `<div class="no-category">
                  <p class="no-category__name">
                    ${ msg }
                  </p>
                </div`
    return(html);
  }

  textField.on("keyup", function(){
    var input = textField.val();
    $(".select-wrap").remove();
    $.ajax({
      type: 'GET',
      url: '/boards/category_search',
      data: {keyword: input},
      dataType: 'json'
    })

    .done(function(categories){
      search_result.empty();
      var InsertHTML = '';
      if (categories.length !== 0){
        if (input !== ""){
          search_result.append(buildCategory());
          categories.forEach(function(category){
            InsertHTML = buildCategotyOption(category);
            $("#category-select").append(InsertHTML);
          });
          search_result.addClass('border-bottom mb-4');
        }
        else{
          search_result.removeClass('border-bottom mb-4');
          search_result.remove(buildCategory());
        }
      }
      else{
        search_result.addClass('border-bottom mb-4');
        search_result.append(appendErrMsgToHTML("一致するカテゴリーはありません"));
      }
    })
    .fail(function(){
      alert('カテゴリー検索に失敗しました');
    })
  })
})