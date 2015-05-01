$(function(){
  $('.new-comment-btn').click(function(event){
    event.preventDefault();
    var url = $(this).parent().attr('action');
    // $('#new_comment').remove();
    $.ajax({url: url})
      .done(function(response){
        $('.new-comment-btn').hide();
        $('#comments-section').prepend(response);
      })
  });

  $('.reply_link').click(function(event){
    event.preventDefault();
    var link = this
    var url = $(this).attr('href');
    $.ajax({url: url})
      .done(function(response){
        $('#new_comment').remove();
        debugger;
        $(link).closest(".comments").append(response);
        $(link).hide();
      })
  });

  $('#comments-section').on('submit', '#new_comment', function(event){
    event.preventDefault();
    var entry = $(this).serialize();
    var url = $(this).attr('action');
    var type = "POST";

    $.ajax({
      url: url,
      type: type,
      data: entry
    })
      .done(function(response){
        debugger;
        $('#new_comment').closest(".comments").prepend(response);
        $('#new_comment').remove();
        $('.new-comment-btn').show();
      })
  });
})

