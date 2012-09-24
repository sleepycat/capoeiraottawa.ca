//= require jquery
//= require rails
//= require_self
$(document).ready(function(){
  console.log('testing!')
  $('body').css({'background-size': screen.width + 'px ' + screen.height + 'px' });
  $('.notice').delay(2000).fadeOut(2000);
});
