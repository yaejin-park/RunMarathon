$(function(){
	$("#wrap").addClass("main");
	
	// main-vis
	var mainSwiper = new Swiper(".main-vis", {
		slidesPerView: 1,
        loop: true,
		autoplay: {
			delay: 5000,
		},
		observer: true,
		observeParents: true,
		effect: 'fade',
		fadeEffect: {
			crossFade: true
		},
		pagination: {
			el: ".main-vis .swiper-pagination",
		},
		on:{
			slideChangeTransitionEnd: function(){
				gsap.to($(".main-vis .swiper-slide").eq(this.activeIndex).find(".txt1"), 0.6 , {top:0, opacity:1, ease:Power0.easeNone});
				gsap.to($(".main-vis .swiper-slide").eq(this.activeIndex).find(".txt2"), 0.6 , {delay:0.4, top:0, opacity:1, ease:Power0.easeNone});
				gsap.to($(".main-vis .swiper-slide").eq(this.activeIndex).find(".btn-wrap"), 0.6 , {delay:0.6, top:0, opacity:1, ease:Power0.easeNone});
			}
		}
	});
	
	// main > review
	var reviewSwiper = new Swiper(".main-sec.review", {
		slidesPerView: "auto",
		centeredSlides: true,
        loop: true,
		observer: true,
		observeParents: true,
		navigation: {
			nextEl: '.main-sec.review .swiper-button-next',
			prevEl: '.main-sec.review .swiper-button-prev',
		},
	});
	
	$(window).resize(function(){
		$(".main-vis").height($(".main-vis").find(".bg.video video").height());
	}).resize();
	
	$(window).on("load", function(){
        $(".main-sec.review .img-div").each(function(){
            if($(this).find("img").width() > $(this).find("img").height()){
                $(this).find("img").width("auto");
                $(this).find("img").height("100%");
            }else{
                $(this).find("img").width("100%");
                $(this).find("img").height("auto");
            }
        });
    });

	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		if($(".main-sec.course").offset().top < scrollTop + $("header").height()){
			//console.log("섹션1");
            gsap.to($(".main-sec.course .txt1"), 0.8, {top:0, opacity:1, ease:Power3.easeOut});
            gsap.to($(".main-sec.course .txt2"), 0.8, {top:0, opacity:1, ease:Power0.easeNone});
            gsap.to($(".main-sec.course .txt3"), 0.8, {delay:0.3, top:0, opacity:1, ease:Power0.easeNone});
		}
	});
});