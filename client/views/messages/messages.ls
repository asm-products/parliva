angular.module('parliva').controller 'MessagesController', <[ $scope $meteor ]> ++ ($scope, $meteor) ->
	$scope.messages = $meteor.collection(Messages, false).subscribe('messages')

	$scope.latestMessages = (messages) ->
		for userId, msgs of (_.groupBy messages, (m) -> m.senderId)
			_.max msgs, (m) -> m.date
	