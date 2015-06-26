angular.module("parliva").controller 'ProfileController', <[ $scope $interval $rootScope $meteor plCategories ]> ++ ($scope, $interval, $rootScope, $meteor, plCategories) ->
	$scope.categories = plCategories.get()
	console.log $scope.categories
	$scope.save = ->
		if $scope.portrait
			$rootScope.currentUser.profile.portraitURL = $scope.portrait.url()
		(err, result) <- Meteor.users.update $rootScope.currentUser._id, $set:
			profile: $rootScope.currentUser.profile

		if err
			sweetAlert("Oops...", "Something went wrong!", "error")
		else
			swal("Profile saved!", "You successfully saved your profile!", "success")
	
	Tracker.autorun (comp) ->
		user = Meteor.user!
		if user && user.profile && user.profile.portraitId
			$scope.portrait = Portraits.findOne(user.profile.portraitId)

		if !comp.firstRun
			$scope.$apply!

	$scope.changePortrait = (files)->
		if files.length > 0
			Portraits.insert files[0], (err, fileObj) ->
				if !err
					Meteor.users.update $rootScope.currentUser._id, $set:
						"profile.portraitId": fileObj._id
