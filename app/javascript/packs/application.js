// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
import "bootstrap"
import "../stylesheets/application"
require("trix")
require("@rails/actiontext")
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
document.addEventListener("turbolinks:load", function() {
  // ...


//Jquery
$(function() {
var carouselLength = $('.carousel-item').length - 1;
console.log(carouselLength);

if (carouselLength) {
    $('.carousel-control-next').removeClass('d-none');
}

$('.carousel').carousel({
    interval: false,
    wrap: false
}).on('slide.bs.carousel', function (e) {
    // First one
    if (e.to == 0) {
        $('.carousel-control-prev').addClass('d-none');
        $('.carousel-control-next').removeClass('d-none');
    } // Last one
    else if (e.to == carouselLength) {
        $('.carousel-control-prev').removeClass('d-none');
        $('.carousel-control-next').addClass('d-none');
    } // The rest
    else {
        $('.carousel-control-prev').removeClass('d-none');
        $('.carousel-control-next').removeClass('d-none');
    }
});
});

})
////////////////////////////////////////////
//Javascript

// $(document).ready(function(){
//
// });
