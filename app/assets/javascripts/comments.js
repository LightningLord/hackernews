$(function(){
  $('#new_comment').on("ajax:success", handler.create)

  $('#comments').on("ajax:success", '.comment', handler.destroy)

})


var handler = {
  create : function(e, data, status,xhr){
    $('#comments').append(xhr.responseText)
  },

  destroy : function(e, data, status, xhr){
    $(e.target).parent().remove();

  }

}
