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
		var $postForm = $(this);
		var url = $postForm.attr('action');
		var method = $postForm.attr('method');
		var data =  $postForm.serialize();

  		var request = $.ajax({
  			url: url,
  			method: method,
  			data: data
  		})
  		request.done(function(response){
        console.log(response)
  			$('#games-container').append(response)
  			$postForm.remove();
  			$('#get-host-form').show();
  		})
	});
}
