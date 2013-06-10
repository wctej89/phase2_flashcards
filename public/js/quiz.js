$(document).ready(function() {

  $('#card').on('submit', function(e) {
    e.preventDefault();
    user_answer = $('#card input').val();
    path = $('#card').attr('action')+'/'+user_answer;
    next_path = '/next'+ $('#card').attr('action');
    console.log(next_path);
    $("#button").fadeOut(500);
    $("#guess").fadeOut(500);
    $("#next").delay(1000).fadeIn(1000);
    $("#answer").delay(1000).fadeIn(500);
    send_answer();
  });

  var redirect = function(url){
    window.location = url;
  }

  var get_next_card = function(url){
    $.ajax({
      type: "GET",
      url: url
    }).done(function(data) {
      path = '/deck/'+data["deck"]+'/'+data["id"];
      $('#question').text(data["question"]);
      $('#card').attr('action', path);
    });
  }

  var button_for_next = function(url){
    $("#next_card").on('click', function () {
      $("#next").fadeOut(500);
      $("#answer").fadeOut(500);
      $("#guess").val('');
      $("#button").delay(1000).fadeIn(500);
      $("#guess").delay(1000).fadeIn(500);
      get_next_card(url);
    });
  }

  var send_answer = function() {
    var response = $.ajax({
      type: "POST",
      url: path
    });
    response.done(function(data) {
      $('#answer').html(data["answer"]);
      button_for_next(data["url"]);
    });
  } 
});
