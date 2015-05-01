$(function(){
  $('.new-comment-btn').click(function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      url: url
    })
      .done(function(response){
        $('.main').prepend(response);
      })
  });

//   $('main').on('submit', '#post_form', function(event){
//     event.preventDefault();
//     var entry = $(this).serialize();
//     var url = $(this).attr('action');
//     var type = "POST";
//
//     $.ajax({
//       url: url,
//       type: type,
//       data: entry
//     })
//       .done(function(response1){
//         $('#posts').prepend(response1);
//         $('#post_form').remove();
//         $('#new_post_link').show();
//       })
//   });
})

