$(function(){
  $('.post_vote').on("ajax:success", postVoteHandler.updatePoints)
})

var postVoteHandler = {
  updatePoints: function(e, data, status, xhr){
    $('#post_points').html(xhr.responseJSON.points)
  }
}
