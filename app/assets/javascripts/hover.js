$(function() {
	$("[rel='tooltip']").tooltip();    
});
 
$('.thumbnail').hover(
    function(){
        $(this).find('.caption-top').fadeIn(200); // .slideDown(300);
    },
    function(){
        $(this).find('.caption-top').fadeOut(200); // .slideUp(300);
    }
); 