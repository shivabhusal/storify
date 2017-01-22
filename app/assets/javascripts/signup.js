$(document).ready(function(){
  if($('body.registrations').length == 0) return false;
  $("#user_country_code").intlTelInput();
  $("#user_country_code").on("countrychange", function(e, countryData) {
    // do something with countryData
    $(this).val(countryData.dialCode);
  });
});
