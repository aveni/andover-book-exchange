$(function() {
	$("[rel='tooltip']").tooltip();    
});
 
$('.thumbnail').hover(
    function(){
        $(this).find('.caption-top').slideDown(300); //.fadeIn(200);
    },
    function(){
        $(this).find('.caption-top').slideUp(300); //.fadeOut(200); 
    }
); 
