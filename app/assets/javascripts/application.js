// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/sortable
//= require best_in_place
//= require turbolinks
//= require_tree .

$(document).on('ready page:load', function () {
	$(document).on('ajax:success', '.nav', function (e) {
			$(e.currentTarget).closest(".card").fadeOut();
	});

	$(".dissbutt").mouseover(function() {
			$(".dismiss").fadeOut();
	});
	$( "#board" ).sortable({
		appendTo: $( '#board'),
		update: function() {
			$.post($(this).data('update-url'),
			$(this).sortable('serialize'));
		}
	});
});



