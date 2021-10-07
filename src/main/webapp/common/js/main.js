$(function(){
	$("#wrap").addClass("main");
	
	// swiper 롤링
	var mainSwiper = new Swiper(".main-vis", {
		slidesPerView: 1,
        loop: true,
		autoplay: true,
		pagination: {
			el: ".main-vis .swiper-pagination",
		},
		on:{
			slideChangeTransitionEnd: function(){
				gsap.to($(".main-vis .swiper-slide").eq(this.activeIndex).find(".txt1"), 0.6 , {top:0, opacity:1, ease:Power0.easeNone});
				gsap.to($(".main-vis .swiper-slide").eq(this.activeIndex).find(".txt2"), 0.6 , {delay:0.4, top:0, opacity:1, ease:Power0.easeNone});
			}
		}
	});
});