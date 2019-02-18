$(document).ready(function(){
	$('#comment-add').on('click', function(e) {
		var text = $('#comment-text').val().trim(text),
			valid = false,
			$formComment = $('form-comment'),
			$notify = $("<div class='notification'><div class='notification__title notification--error '>Комментарий не может быть пустым</div></div>");

		if (text.length == 0 && text == '') {
			e.preventDefault();                            
			valid = false;
			$('.comments-form').find('.notification').remove();
			$($notify).insertBefore('#form-comment');
		} else {
			valid = true;
			$('.comments-form').find('.notification').remove();
			if(valid === true){
				$formComment.submit();
			}
		}
	});
});