$(document).ready(function() {
  
  $('#signup_form').on('click', '#createbutton', function(e) {
    e.preventDefault();
    $('#confirmation').attr('style', 'display: block;');
    $('#loginbutton').attr('style', 'display: none;');
    $('#createbutton').attr('id', '#newcreatebutton');
    $('#signup_form').attr('action', '/users');
  });
});
