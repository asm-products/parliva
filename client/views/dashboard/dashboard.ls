angular.module('angularMeteor').controller 'DashboardController', <[ $scope $meteor ]> ++ ($scope, $meteor) ->
	$scope.state = {
		currentDate: new Date()
	}

	$scope.open = ($event) ->
		$scope.state.opened = true;




