 /*global jQuery*/

(function($) {

// admin show
 $(function() {
  
  //user side view
  $(".admin-image").hide().fadeIn(2000);
    
  $(".about-us-btn").click(function(){
  $(".about-us-text").slideDown(1000);
  });
  

}); 

// user show
 $(function() {
 $(".centered").hide().fadeIn("slow");
 
});

//stock list

 $(function() {
 $(".stock-list-title").click(function(){
  $(".stock-list").slideDown(1000);
 });
}); 





}(jQuery));