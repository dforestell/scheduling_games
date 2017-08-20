$(document).ready(function() {
	getHostForm();
	postGame();
});

var getHostForm = function(){
	$('#get-host-form').on('click', function(event){
		event.preventDefault();	
		var $hostLink = $(this);
		var url = $hostLink.attr('href')

		var request = $.ajax({
			method: 'GET',
			url: url
		})
		request.done(function(response){
			$hostLink.before(response);
			$hostLink.hide();
		})
		request.fail(function(response){
			$hostLink.before(response.responseText);
			$hostLink.hide();
		})
	})
}

var postGame = function(){
	$('.container').on('submit', '#post-game', function(event){
		event.preventDefault();
		alert('clicky')
	})
}