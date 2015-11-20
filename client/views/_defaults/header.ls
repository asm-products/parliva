angular.module('angularMeteor').controller 'HeaderController', <[ $scope $location ]> ++ ($scope, $location) ->
	$scope.isPath = (path) ->
		pathRegex = new RegExp(path)
		pathRegex.test($location.path())

