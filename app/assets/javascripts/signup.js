$(document).ready(function(){
  if($('body.registrations').length == 0) return false;
  $("#user_country_code").countrySelect();
});
