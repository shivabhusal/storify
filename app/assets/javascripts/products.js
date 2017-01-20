$(document).ready(function(){
  if($('.body.products').length == 0) return false;
  $('#search-price-slider').slider();
  $('#search-categories').multiselect();
});
