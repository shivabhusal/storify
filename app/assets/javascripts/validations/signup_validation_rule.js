$(document).ready(function () {
  if ($('body.registrations').length == 0) return false;
  options = {
    rules: {
      "user[first_name]": {
        required: true
      },
      "user[last_name]": {
        required: true
      },
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        minlength: 8,
        maxlength: 30
      },
      "user[password_confirmation]": {
        required: true,
        minlength: 8,
        maxlength: 30,
        equalTo: $('#user_password')
      },
      "user[phone_number]": {
        required: true,
        minlength: 9,
        maxlength: 10
      }
    }
  };
  $('.new_user').validate(options);
  $('.edit_user').validate(options);
});
