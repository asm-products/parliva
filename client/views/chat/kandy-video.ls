@KandyAux = {}
callId = null
audio = null

KandyAux.init = ($scope) ->

	# $audioRingIn = $('<audio>',
	# 	loop: 'loop'
	# 	id: 'ring-in')
	# $audioRingOut = $('<audio>',
	# 	loop: 'loop'
	# 	id: 'ring-out')
	# audioSource = 
	# 	ringIn: [
	# 		{
	# 			src: 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringin.mp3'
	# 			type: 'audio/mp3'
	# 		}
	# 		{
	# 			src: 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringin.ogg'
	# 			type: 'audio/ogg'
	# 		}
	# 	]
	# 	ringOut: [
	# 		{
	# 			src: 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringout.mp3'
	# 			type: 'audio/mp3'
	# 		}
	# 		{
	# 			src: 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringout.ogg'
	# 			type: 'audio/ogg'
	# 		}
	# 	]
	# audioSource.ringIn.forEach (entry) ->
	# 	$source = $('<source>').attr('src', entry.src)
	# 	$audioRingIn.append $source
	# 	return
	# audioSource.ringOut.forEach (entry) ->
	# 	$source = $('<source>').attr('src', entry.src)
	# 	$audioRingOut.append $source
	# 	return

	$ ->
		console.log "running setup"
		kandy.setup do
			remoteVideoContainer: $('#theirVideo')[0]
			localVideoContainer: $('#myVideo')[0]
			listeners:
				setupsuccess: ->
					console.log "setup success"

				loginsuccess: ->
					console.log "logged in!"
					KandyAPI.Phone.updatePresence 0

				loginfailed: ->
					console.log "login failed!"

				callinitiated: (call) !->
					callId := call.getId()
					swal {
						title: 'Waiting for the user to answer the call...'
						type: 'info'
						confirmButtonColor: '#ec971f'
						confirmButtonText: 'End call'
					}, (isConfirm) ->
						if isConfirm
							KandyAux.endCall!
						
					console.log "Call inititated"

				callinitiatefailed: (call) ->
					# audio.ringOut.pause()
					swal.close!
					$scope.aux.callStatus = "none"
					$scope.$apply!

				oncall: (call) ->
					console.log "oncall"
					swal.close!
					$scope.aux.callStatus = "onCall"
					$scope.$apply!
					# audio.ringOut.pause()

				callended: (call) ->
					# audio.ringIn.pause()
					# audio.ringOut.pause()
					callId := null
					$('#theirVideo').empty()
					$scope.aux.callStatus = "none"
					$scope.$apply!

				callendedfailed: ->

				callincoming: (call, isAnonymous) ->
					console.log "incoming call!"
					callId := call.getId()
					swal {
						title: 'Incoming call'
						text: 'Do you want to answer the call?'
						type: 'info'
						showCancelButton: true
						confirmButtonColor: '#449d44'
						confirmButtonText: 'Answer'
						cancelButtonText: 'Reject'
						closeOnConfirm: false
						closeOnCancel: false
					}, (isConfirm) ->
						if isConfirm
							KandyAux.answerVideoCall!
						else
							KandyAux.rejectCall!
						return

				callanswered: (call, isAnonymous) ->
					swal.close!
					$scope.aux.callStatus = "onCall"
					$scope.$apply!
					# audio.ringIn.pause()

				callrejected: ->
					swal {
						title: "Call rejected"
						type: 'error'
					}
					console.debug('callrejected');
					callId = null;
					$scope.aux.callStatus = "none"
					$scope.$apply!

	KandyAux.login = (user, pass) ->
		$scope.aux.kandyStatus = "logging"
		$scope.$apply!

		kandy.login "DAKdfa40b049ccd4e218d787fec86e6c98b", user, pass, ->
			console.log "logged in"
			Session.set("isKandyLoggedIn", true)
			loggedInCallback!
		, ->
			console.log "error logging in"

	loggedInCallback = ->
		$scope.aux.kandyStatus = "loggedIn"
		$scope.$apply!

	if Session.get("isKandyLoggedIn")
		loggedInCallback!
	else
		Meteor.call 'getKandyData', (err, result) ->
			console.log "getKandyData", err, result
			if !err
				KandyAux.login result.user_id, result.user_password

	KandyAux.answerVideoCall = ->
		swal {
			title: "Connecting..."
			text: "Please allow access to camera and microphone."
			showConfirmButton: false
		}
		
		console.log "answering..."
		kandy.call.answerCall callId, true


	KandyAux.makeCall = (user_id) ->
		swal {
			title: "Connecting..."
			text: "Please allow access to camera and microphone."
			showConfirmButton: false
		}
		
		$scope.aux.callStatus = "calling"
		kandy.call.makeCall user_id, true
		# audio.ringOut.play()

	KandyAux.rejectCall = ->
		swal.close!
		kandy.call.rejectCall callId

	KandyAux.endCall = ->
		kandy.call.endCall callId
