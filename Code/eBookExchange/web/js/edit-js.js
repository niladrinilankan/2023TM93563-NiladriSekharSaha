


jQuery(function($){
	

var $getElem = $('.banner-slider'),
		getElemChild = $.map( $getElem.find('.item'), function( val, index ){
			return val;
		} ),
		elemChildLength = getElemChild.length;
		
$getElem.owlCarousel({
	 items:1,
	 center: false,
	 loop: ( elemChildLength > 1 ) ? true : false,
	 mouseDrag: ( elemChildLength > 1 ) ? true : false,
	 touchDrag: ( elemChildLength > 1 ) ? true : false,
	 //box-model
	 autoWidth: false,
	 stagePadding: 0,
	 margin:0,
	 //directional navigation
	 nav:true,
	 navRewind:false,
	 navText: ['',''],
	 slideBy:1,
	 navSpeed: 700,
	 //page navigation
	 dots:false,
	 dotsEach:false,
	 dotData:false,
	 dotsSpeed: 700,
	 //lazy-load
	 lazyLoad: false,
	 //video
	 video: true,
	 videoWidth: false,
	 videoHeight: false,
	 //autoplay
	 autoplay:true,
	 autoplayTimeout:1500,
	 autoplayHoverPause: false,
	 autoplaySpeed:1500,
	 //animateOut: 'fadeOut',
	 //responsive
	 responsiveRefreshRate: 200,
	 responsiveBaseElement: window,
	 //direction
	  
});

$('#example').DataTable({
	responsive: true,
	paging:true,
        order:[]
});

$('.category-listing ul.submenu').parents('li').prepend('<i class="arrw"></i>');

$('.category-listing > li > a').on('click', function(event){
	$(this).parent().toggleClass('actv');
	$(this).next('.submenu').slideToggle(300);
	$(this).parent().siblings().find('.submenu').slideUp(300);
	$(this).parent().siblings().removeClass('actv');
	event.preventDefault();
});

});
	
	
	
	
	
	
	
	
	
	