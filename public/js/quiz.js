$(document).ready(function() {

  $('#card').on('submit', function(e) {
    e.preventDefault();
    user_answer = $('#card input').val();
    path = $('#card').attr('action')+'/'+user_answer;
    next_path = '/next'+ $('#card').attr('action');
    console.log(next_path);

    $("#next").fadeIn(500);
    send_answer();
  });

  var redirect = function(url){
    window.location = url;
  }

  var get_next_card = function(url){
    console.log("WE ARE HERE");
    console.log(url);
    $.ajax({
      type: "GET",
      url: url
    }).done(function(data) {
      console.log("WE ARE HERE THREEEE");
      console.log(data);
      console.log(data["deck"]);
      path = '/deck/'+data["deck"]+data["id"];
      $('#question').text(data["question"]);
      $('#card').attr('action', path);
    });
  }

  var button_for_next = function(url){
    $("#next_card").on('click', function () {
      $("#next").fadeOut(200);
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
