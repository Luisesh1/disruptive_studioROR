// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require materialize
//= require jquery
//= require jquery_ujs
//= require_tree .
document.addEventListener('DOMContentLoaded', function() {
    var elements = document.querySelectorAll('.button-collapse');
    for (var i = 0; i < elements.length; i++) {
      var elem = elements[i];
      M.Sidenav.init(elem);
    }
  });
  
