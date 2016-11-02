
function main() {

jQuery(function($){

	// Scroll to top
	var scrollToTop = function() {
		var link = $('.scroll-top');

		$(window).scroll(function() {
			if ($(this).scrollTop() > 150) {
				link.fadeIn(100);
			} else {
				link.fadeOut(100);
			}
		});
		link.click(function() {
			$('html, body').animate({scrollTop: 0}, 1000);
			return false;
		});
	};
	scrollToTop();

	new WOW().init();
		

  	$(document).ready(function() {

  	});



});




(function($){
	 $(function(){

		// sidepannel
		$('.item-children').children('a').on('click', function(event){
			event.preventDefault();
			$(this).toggleClass('submenu-open').next('.item-sub-menu').slideToggle(200).end().parent('.item-children').siblings('.item-children').children('a').removeClass('submenu-open').next('.item-sub-menu').slideUp(200);
		});

    });
})(jQuery);




}
main();