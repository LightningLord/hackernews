$(function(){



  $('#new_comment').on("ajax:success", function(e, data, status, xhr){
    $('#comments').append(xhr.responseText)
  })

})
