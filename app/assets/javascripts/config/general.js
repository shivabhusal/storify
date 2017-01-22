$.config = {};
$.config.dateFormat = 'dd/mm/yyyy';
$.config.validImageFileExtensions = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];
$.config.validImageFileExtensionsRegex = /\.(jpe?g|png|gif|bmp)$/i;
$.config.maxUploadedFileSizeInKB = 6291456; // 6MB 6*1024*1024


$.showFlashMessage = function (message, type) {
  var bar = '<div class="the-flash alert alert-' + type + ' main_alert" role="alert">' +
      '<a class="close" href="#" data-dismiss="alert" aria-label="close"> &times</a>' +
      message +
      '</div>';
  $(bar).insertAfter('.placeholder-for-flash')
};
