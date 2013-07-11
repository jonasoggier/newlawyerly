$(document).ready(function() {
	$('li#comments-show').click(function(event) {
		event.preventDefault();
  	$(this).next().toggle();
	});
});