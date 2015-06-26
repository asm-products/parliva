Router.route '/paypal', ->
	console.log "paypal!"
	console.log @request
	console.log @response
	@response.end('file download content\n');

, where: 'server'
