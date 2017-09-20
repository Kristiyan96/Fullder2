$(document).on('turbolinks:load', function() {
  $('.product-main').on('click tap', function() {
    $(this).next().toggle('fast');
  });
});

