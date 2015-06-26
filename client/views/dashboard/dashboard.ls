angular.module('parliva').controller 'DashboardController', <[ $scope $meteor $state plCategories ]> ++ ($scope, $meteor, $state, plCategories) ->
	$scope.categories = plCategories.get()
	$scope.categoryLabel = (categoryKey) ->
		category = _.find $scope.categories, (c) -> c.key == categoryKey
		category.label if category

	$scope.users = $meteor.collection(->
		Meteor.users.find({ _id: { $ne: Meteor.userId!}})
	, false).subscribe('consultors')


	$scope.chat = (user) ->
		$state.go 'chat', userId: user._id
	