//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require date
//= require chosen-jquery
//= require jquery.remotipart
//= require jquery_nested_form
//= require init
//= require jquery.html5-placeholder-shim
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap3
//= require underscore
//= require gritter
//= require bootstrap
//= require_tree .

// Custom JavaScript for the Side Menu and Smooth Scrolling //

$(document).ready(function(){
  $("#menu-close").click(function(e) {
    e.preventDefault();
    $("#sidebar-wrapper").toggleClass("active");
  });
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#sidebar-wrapper").toggleClass("active");
  });
  $(function() {
    $('a[href*=#]:not([href=#])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
        || location.hostname == this.hostname) {

        var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
  });
});