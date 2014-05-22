$(function(){
  $('#new_comment').on("ajax:success", commentHandler.create)

  $('#comments').on("ajax:success", '.delete', commentHandler.destroy)

  $('#comments').on("ajax:success", '.edit', commentHandler.edit)

  $('#comments').on("ajax:success", '.edit_comment', commentHandler.update)

})


var commentHandler = {
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
