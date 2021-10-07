$(function(){
	$("header .menu-btn").click(function(){
		if(!$(this).hasClass("active")){
			$(this).addClass("active");
			$("header").addClass("active");
			$("header .menu").fadeIn(500);	
		}else{
			$(this).removeClass("active");
			$("header").removeClass("active");
			$("header .menu").fadeOut(500);	
		}
	});
});