// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery
//= require jquery_ujs
//= require materialize
//= require_tree .
//= require_self

document.addEventListener('turbo:load', function() {
    M.updateTextFields();
  });
