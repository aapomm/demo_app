$(function(){
  AutoComplete({}, '.js-autocomplete');
});

$(window).load(function(){
  var $autoInput = $('.js-autocomplete')[0];

  $('.autocomplete').attr(
    "style", "top:" + ($autoInput.offsetTop + $autoInput.offsetHeight) + "px;left:" + $autoInput.offsetLeft + "px;width:" + $autoInput.clientWidth + "px;"
  );
});
