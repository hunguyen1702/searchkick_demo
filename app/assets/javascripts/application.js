// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require lib/angular
//= require lib/angular-animate
//= require lib/angular-touch
//= require bootstrap/dist/js/bootstrap
//= require lib/ui-bootstrap
//= require lib/moment
//= require lib/angular-moment.min
//= require i18n/translations
//= require_tree .


$(document).ready(function(){
  $("#post_search").autocomplete({
    source: "/posts/autocomplete"
  });
});
