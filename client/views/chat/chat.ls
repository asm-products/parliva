
angular.module('parliva').controller 'ChatController', <[ $scope $meteor $stateParams ]> ++ ($scope, $meteor, $stateParams) ->
	$scope.aux = {
		callStatus: "none"

	}

	$scope.newMessage = {}
	
	$scope.messages = $meteor.collection(Messages, false).subscribe('chat_messages', $stateParams.userId)
	$scope.partners = $meteor.collection(Meteor.users, false).subscribe('chat_partners', $stateParams.userId)
	$scope.partner = $meteor.object(Meteor.users, $stateParams.userId);

	$scope.call = ->
		# TODO: Make call with webrtc

	$scope.endCall = ->
		# TODO: End call with webrtc

	$scope.isMe = (message) ->
		$scope.currentUser && message.senderId == $scope.currentUser._id

	$scope.sendMessage = ->
		$scope.messages.save do
			roomUserIds: [$scope.currentUser._id, $scope.partner._id]
			text: $scope.newMessage.text
			userName: $scope.currentUser.username
			senderId: $scope.currentUser._id
			portraitURL: $scope.currentUser.profile && $scope.currentUser.profile.portraitURL
		$scope.newMessage = {}

	setTimeout ->
		chatContainer = $('.panel-body');
		chatContainer.scrollTop(chatContainer.prop("scrollHeight"));
	, 1000

	Meteor.call 'pay', $stateParams.userId, (error, result) ->
		console.log error, result
		$scope.paypalUrl = result
		$scope.$apply!
