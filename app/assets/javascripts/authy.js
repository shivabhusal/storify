$(document).ready(function () {
  if ($('.body.carts.pre_checkout').length == 0) return false;

  var checkForOneTouch = function () {
    $.get("/authy/status", function (data) {
      if (data == 'approved') {
        $.showFlashMessage('Request has been accepted. Proceeding to checkout..', 'info');
        $('#verification-form').get(0).submit();
      } else if (data == 'denied') {
        $.showFlashMessage('Request has been denied.', 'danger')
      } else {
        setTimeout(checkForOneTouch, 2000);
      }
    })
  };

  checkForOneTouch();
});
