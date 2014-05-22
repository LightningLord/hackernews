$(function(){
  $('.post_vote').on("ajax:success", function(e, data, status, xhr){
    $('#post_points').html(xhr.responseJSON.points)
  })

  $('.postvote').on('ajax:error', function(xhr, data, status) {

  })
})
