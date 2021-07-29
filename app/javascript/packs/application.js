// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
});

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from './map';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})

// FAQ Page
(function(){
  var searchTerm, panelContainerId;
  // Create a new contains that is case insensitive
  $.expr[':'].containsCaseInsensitive = function (n, i, m) {
    return jQuery(n).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
  };

  $('#accordion_search_bar').on('change keyup paste click', function () {
    searchTerm = $(this).val();
    $('#accordion > .panel').each(function () {
      panelContainerId = '#' + $(this).attr('id');
      $(panelContainerId + ':not(:containsCaseInsensitive(' + searchTerm + '))').hide();
      $(panelContainerId + ':containsCaseInsensitive(' + searchTerm + ')').show();
    });
  });
}());

var parallax = function(e) {
    var windowWidth = $(window).width();
    if (windowWidth < 768) return;
    var halfFieldWidth = $(".parallax").width() / 2,
      halfFieldHeight = $(".parallax").height() / 2,
      fieldPos = $(".parallax").offset(),
      x = e.pageX,
      y = e.pageY - fieldPos.top,
      newX = (x - halfFieldWidth) / 30,
      newY = (y - halfFieldHeight) / 30;
    $('.parallax [class*="wave"]').each(function(index) {
      $(this).css({
        transition: "",
        transform:
          "translate3d(" + index * newX + "px," + index * newY + "px,0px)"
      });
    });
  },
  stopParallax = function() {
    $('.parallax [class*="wave"]').css({
      transform: "translate(0px,0px)",
      transition: "all .7s"
    });
    $timeout(function() {
      $('.parallax [class*="wave"]').css("transition", "");
    }, 700);
  };
$(document).ready(function() {
  $(".not-found").on("mousemove", parallax);
  $(".not-found").on("mouseleave", stopParallax);
});

