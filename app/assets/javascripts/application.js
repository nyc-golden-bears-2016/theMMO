// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require ./d3.min.js
//= require ./image_loader.js.erb
//= require ./battle_display.js.erb
//= require ./character.js.erb
//= require ./game.js.erb
//= require ./enemy.js.erb
//= require ./controls.js.erb
//= require ./graphics.js.erb
//= require ./socket.js.erb
//= require ./battle.js.erb
//= require_tree .
    var slider = $("#the_slider").slider({
        range: true,
        min: 200,
        max: 500,
        values: [250, 450],
        slide: function(event, ui) {
            $("#character_attack").val(ui.values[0]);
            $("#character_health").val(ui.values[0]);
            $("#character_XP").val(ui.values[0]);
            $("#character_defense").val(ui.values[0]);
            $("#character_max_health").val(ui.values[0]);
        }
    });
    $("#character_attack").val(slider.slider("values")[0]);
    $("#character_XP").val(ui.values[0]);
    $("#character_attack").val(ui.values[0]);
    $("#character_defense").val(ui.values[0]);
    $("#character_max_health").val(ui.values[0]);
}
 