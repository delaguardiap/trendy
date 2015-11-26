$(function(){
	var clicked = true;
	$("#check_in_link").on('click', function(){
		if(clicked) {
			clicked = false;
			$("#check_in").slideDown(400);
		} else {
			clicked = true;
			$("#check_in").slideUp(400);	
		}
	});
	// $("#upvote").on('click', function(){
		
	// });
});