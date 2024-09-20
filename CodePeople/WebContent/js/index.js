$(function () {
  
  $("#header-right-menu .header-link .myPage").on('click', function () {
    $.ajax({
      url: "url",
      type: "method",
      data: "data",
      dataType: "dataType",
      success: function (res) {
        
      },
      error: function (xhr) {
        
      }
    });
  });
});