$(function(){
  $('.post_vote').on("ajax:success", voteHandler.updatePostPoints)
  $('.comment_vote').on("ajax:success", voteHandler.updateCommentPoints)
})

var voteHandler = {
  updatePostPoints: function(e, data, status, xhr){
    $('#post_points').html(xhr.responseJSON.points)
  },
  updateCommentPoints: function(e, data, status, xhr){
    $(e.target).parent().parent().find(".comment_points").html(xhr.responseJSON.points)
  }
}
