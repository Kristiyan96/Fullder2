document.addEventListener("turbolinks:load", function() {
  $('.product-quantity .fa-arrow-down').on('click tap', function() {
    var input = $(this).next().children()[0];
    var value = Number(input.value);

    value-1 < 1 ? input.value=1 : input.value=value-1;
  });
  $('.product-quantity .fa-arrow-up').on('click tap', function() {
    var input = $(this).prev().children()[0];
    var value = Number(input.value);

    input.value = value+1;
  });
})