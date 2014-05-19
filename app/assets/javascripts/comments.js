$(function(){
  $('#new_comment').on("ajax:success", handler.create)

  $('#comments').on("ajax:success", '.delete', handler.destroy)

  $('#comments').on("ajax:success", '.edit', handler.edit)

  $('#comments').on("ajax:success", '.edit_comment', handler.update)

})


var handler = {
  create : function(e, data, status,xhr){
    $('#comments').append(xhr.responseText)
  },

  destroy : function(e, data, status, xhr){
    $(e.target).parent().remove();
  },

  edit : function(e, data, status, xhr){
    $(e.target).parent().replaceWith(xhr.responseText)
  },
  update : function(e, data, status, xhr){
    $(e.target).parent().parent().replaceWith(xhr.responseText)
  }

}
