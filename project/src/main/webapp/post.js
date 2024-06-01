function autoResizeTextarea(textarea) {
	textarea.style.height = 'auto'; 
	textarea.style.height = (textarea.scrollHeight+15) + 'px';
}

document.addEventListener('DOMContentLoaded', function() {
	const textarea = document.getElementById('comment-textarea');
	textarea.addEventListener('input', function() {
		autoResizeTextarea(textarea);
	});
	autoResizeTextarea(textarea);
});