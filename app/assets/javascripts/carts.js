jQuery(document).ready(function($){
  var cartWrapper = $('.cd-cart-container');

  if( cartWrapper.length > 0 ) {
    //store jQuery objects
    var cartBody = cartWrapper.find('.body')
    var cartList = cartBody.find('ul').eq(0);
    var cartTotal = cartWrapper.find('.checkout').find('span');
    var cartTrigger = cartWrapper.children('.cd-cart-trigger');
    var cartCount = cartTrigger.children('.count');

    //open/close cart
    cartTrigger.on('click', function(event){
      event.preventDefault();
      toggleCart();
    });

    //close cart when clicking on the .cd-cart-container::before (bg layer)
    cartWrapper.on('click', function(event){
      if( $(event.target).is($(this)) ) toggleCart(true);
    });
  }
  function toggleCart(bool) {
    var cartIsOpen = ( typeof bool === 'undefined' ) ? cartWrapper.hasClass('cart-open') : bool;
    
    if( cartIsOpen ) {
      cartWrapper.removeClass('cart-open');

      setTimeout(function(){
        cartBody.scrollTop(0);
        //check if cart empty to hide it
        if( Number(cartCount.find('li').eq(0).text()) == 0) cartWrapper.addClass('empty');
      }, 500);
    } else {
      cartWrapper.addClass('cart-open');
    }
  }
});