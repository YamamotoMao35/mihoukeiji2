$(function(){
  var textField = $("#category-form");
  var search_result = $("#category-search-result")

  function buildCategory(){
    var html = `<div class="form-group">
                  <div class="select-wrap">
                    <ul class="form-category-list hover" id="category-select">
                    </ul>
                  </div>
                </div>`
    return html;
  }
  function buildCategotyOption(category){
    var categoryOption = `<li data-category-id="${category.id}" data-category-name="${category.name}">${category.name}</li>`
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
        search_result.removeClass('border-bottom mb-4');
        if (input !== ""){
          search_result.append(buildCategory());
          categories.forEach(function(category){
            InsertHTML = buildCategotyOption(category);
            $("#category-select").append(InsertHTML);
          });
        }
        else{
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
  $(document).on("click", "#category-select li", function(){
    search_result.empty();
    var category_id = $(this).attr("data-category-id");
    var category_name = $(this).attr("data-category-name");
    textField.val(`${category_name}`);
    $(document).on("click", ".thread-new-btn", function(){
      textField.val(`${category_id}`);
    })
  })
})