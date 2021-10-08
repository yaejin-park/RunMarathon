$(function(){
	$("header .menu-btn").mouseenter(function(){
		if(!$(this).hasClass("active")){
			gsap.to($(this).find("span").eq(0),0.4, {width:0, yoyo:true, repeat:1, ease:Power3.easeOut});	
			gsap.to($(this).find("span").eq(1),0.4, {delay:0.1, width:0, yoyo:true, repeat:1, ease:Power3.easeOut});	
			gsap.to($(this).find("span").eq(2),0.4, {delay:0.2, width:0, yoyo:true, repeat:1, ease:Power3.easeOut});
		}	
	});
	
	$("header .menu-btn").mouseleave(function(){
		if(!$(this).hasClass("active")){
			gsap.to($(this).find("span").eq(0),0.4, {width:"100%", ease:Power3.easeOut});	
			gsap.to($(this).find("span").eq(1),0.4, {delay:0, width:"100%", ease:Power3.easeOut});
			gsap.to($(this).find("span").eq(2),0.4, {delay:0, width:"100%", ease:Power3.easeOut});
		}
	});
	
	$("header .menu-btn").click(function(){
		if(!$(this).hasClass("active")){
			gsap.to($(this).find("span").eq(0), 0.4,{top:14, rotate:"45deg", ease:Power3.easeOut});
			gsap.to($(this).find("span").eq(1), 0.4,{opacity:0, ease:Power3.easeOut});
			gsap.to($(this).find("span").eq(2), 0.4,{top:14, rotate:"-45deg", ease:Power3.easeOut, onComplete:function(){
				$("header .menu-btn").addClass("active");
			}});
			$("header").addClass("active");
			$("header .menu").fadeIn(500);	
		}else{
			$(this).removeClass("active");
			gsap.to($(this).find("span").eq(0), 0.4,{top:"", rotate:0, ease:Power3.easeOut});
			gsap.to($(this).find("span").eq(1), 0.4,{opacity:1, ease:Power3.easeOut});
			gsap.to($(this).find("span").eq(2), 0.4,{top:"", rotate:0, ease:Power3.easeOut});
			$("header").removeClass("active");
			$("header .menu").fadeOut(500);	
		}
	});
});