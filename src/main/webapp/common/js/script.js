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
	
	$(".detail-icon").mouseover(function(){
		$(this).css("color", "#659EFF");
	});
	$(".detail-icon").mouseleave(function(){
		if(!$(this).parent().parent().next().is(":visible")){
			$(this).css("color", "gray");
		}
	});
	
	$(".accor-title").mouseover(function(){
		$(this).css("cursor", "pointer");
	});
	$(".accor-content").slideUp(0);
	$(".accor-title").click(function(){
		if(!$(this).next().is(":visible")){
			$(this).parents("tr").siblings().find(".accor-content").slideUp();
			$(this).next().slideDown();
			$(this).find('.glyphicon-menu-down').css('color','#659EFF').removeClass("glyphicon-menu-down").addClass("glyphicon-menu-up");
			$(this).parents("tr").siblings().find('.glyphicon-menu-up').css('color','gray').removeClass("glyphicon-menu-up").addClass("glyphicon-menu-down");
		} else{
			$(this).next().slideUp();
			$(this).find(".glyphicon-menu-up").css('color','gray').removeClass("glyphicon-menu-up").addClass("glyphicon-menu-down");
		}
	});
});