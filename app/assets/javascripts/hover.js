$( document ).ready(function() {
    $("[rel='tooltip']").tooltip();    
 
    $('.thumbnail').hover(
        function(){
            $(this).find('.caption-hover').show();
            $(this).find('.caption-static').hide();
        },
        function(){
            $(this).find('.caption-hover').hide();
            $(this).find('.caption-static').show(); 
        }
    ); 
});