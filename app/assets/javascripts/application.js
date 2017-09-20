//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-select
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require select2-full
//= require cocoon
//= require slick.min
//= require foggy
//= require jquery-ui
//= require gmaps/google
//= require moment
//= require clipboard
//= require jquery.remotipart
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  $('.restaurant-search-input').tooltip({
    placement: "bottom",
    trigger: "focus"
  });

  (function(){

    var parallax = document.querySelectorAll(".category-row"),
        speed = 0.2;

    window.onscroll = function(){
      [].slice.call(parallax).forEach(function(el,i){

        var windowYOffset = window.pageYOffset,
            elBackgrounPos = "50% " + (el.offsetTop*2 - windowYOffset * speed) + "px";

        el.style.backgroundPosition = elBackgrounPos;

      });
    };

  })();

})