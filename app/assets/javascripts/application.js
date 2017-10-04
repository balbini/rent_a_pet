// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require turbolinks
//= require typeahead.bundle.min
//= require_tree .
//= require materialize-sprockets
//= require materialize/extras/nouislider

$(document).on("turbolinks:load", function() {
  var threshold = 3;

  if ($(".pet-container, .posted_job-container, .working_job-container").children().not(".show").length > threshold) {
    $(".show.more").css("display", "block");
  }

  $(".show.more").on("click", function() {
    $(this).parent().children().not(".show").css("display", "block");
    $(this).parent().find(".show.less").css("display", "block");
    $(this).hide();
  });

  $(".show.less").on("click", function() {
    $(this).parent().children(":nth-child(n+" + (threshold+1) + ")").not(".show").hide();
    $(this).parent().find(".show.more").css("display", "block");
    $(this).hide();
  });
  $(".carousel").carousel({fullWidth: true});
  setInterval(function(){
    $(".carousel").carousel("next");
  }, 5000);
});
