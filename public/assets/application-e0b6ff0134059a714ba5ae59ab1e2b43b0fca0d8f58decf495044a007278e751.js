// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require_tree .
//= require materialize
//= require jquery
//= require jquery_ujs
  $( document ).ready(function(){ $(".button-collapse").sideNav();});
