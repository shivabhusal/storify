$(document).ready(function () {
  if ($('body.sessions').length == 0) return false;
  options = {
    rules: {
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        minlength: 8,
        maxlength: 30
      }
    }
  };
  $('.new_user').validate(options);
  $('.edit_user').validate(options);
});
