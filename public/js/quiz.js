$(document).ready(function() {

  $('#card').on('submit', function(e) {
    e.preventDefault();
    user_answer = $('#card input').val();
    path = $('#card').attr('action')+'/'+user_answer;
    next_path = '/next'+ $('#card').attr('action');
    $("#button").fadeOut(500);
    $("#guess").fadeOut(500);
    $("#next").delay(1000).fadeIn(1000);
    $("#answer").delay(1000).fadeIn(500);
    send_answer();
  });

  var redirect = function(data){
    $.ajax({
      type: "POST",
      url: next_path
      }).done(function(location){
        window.location = location;
    });
  }

  var button_for_next = function(data){
    $("#next_card").on('click', function () {
      $("#next").fadeOut(500);
      $("#answer").fadeOut(500);
      $("#button").delay(1000).fadeIn(500);
      $("#guess").delay(1000).fadeIn(500);
      redirect(data); 
    });
  }

  var send_answer = function() {
    var response = $.ajax({
      type: "POST",
      url: path
    });
    response.done(function(data) {    
      $('#answer').html(data);
      button_for_next(data);

    });
  } 

});
