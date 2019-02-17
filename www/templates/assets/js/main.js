$(document).ready(function(){

console.log('Документ загружен');


$('#comment-add').on('click', function(e){
e.preventDefault();

	// console.log('Клик');
	var textareas = $('textarea');
	var text = $('#comment-text').val().trim(text);

	var error = $('.notification');
		valid = false;


	if (text.length == '') {
		// console.log('error 0');
		error.fadeIn();
		textareas.focus(function(){ 
		error.fadeOut();                             
		valid = false;
		});
	}else{
		valid = true;
		if(valid === true){
			$('#form-comment').submit();
			
		}
		
	}


});
   
   
});