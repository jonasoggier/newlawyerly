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
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {
	$('#logo').on('click', function(e) {
		e.preventDefault();
  		$('#navbar, .nav-right').animate({
		    "margin-top": "0px"}, 200);
	});
});

// Makes Navbar disappear with click on any element on the page
$(document).ready(function() {
	(function($){
	    $.fn.outside = function(ename, cb){
	        return this.each(function(){
	            var $this = $(this),
	                self = this;

	            $(document).bind(ename, function tempo(e){
	                if(e.target !== self && !$.contains(self, e.target)){
	                    cb.apply(self, [e]);
	                    if(!self.parentNode) $(document.body).unbind(ename, tempo);
	                }
	            });
	        });
	    };
	}(jQuery));

	$('#logo').outside('click', function() {
	    $('#navbar, .nav-right').stop(true, true).animate({
		    "margin-top": "-50px"}, 200);
	});
});