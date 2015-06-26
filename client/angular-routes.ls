angular.module('parliva').config do
	<[ $urlRouterProvider  $stateProvider  $locationProvider ]> ++ 
	(  $urlRouterProvider, $stateProvider, $locationProvider) ->
	
		$locationProvider.html5Mode true

		auth = <[ $meteor ]> ++ ($meteor) -> $meteor.requireUser!

		$stateProvider

		.state 'entrySignIn', url: '/sign-in', template: '<meteor-include src="entrySignIn"></meteor-include>'
		.state 'entrySignUp', url: '/sign-up', template: '<meteor-include src="entrySignUp"></meteor-include>'
		
		# .state 'home',
		# 	url: '/'
		# 	templateUrl: 'client/views/home/home.ng.html'
		# 	controller: 'HomeController'

		.state 'dashboard',
			url: '/dashboard'
			templateUrl: 'client/views/dashboard/dashboard.ng.html'
			controller: 'DashboardController'
			resolve: {currentUser: auth}

		.state 'profile',
			url: '/profile'
			templateUrl: 'client/views/profile/profile.ng.html'
			controller: 'ProfileController'
			resolve: {currentUser: auth}

		.state 'messages',
			url: '/messages'
			templateUrl: 'client/views/messages/messages.ng.html'
			controller: 'MessagesController'
			resolve: {currentUser: auth}

		.state 'chat',
			url: '/chat/:userId'
			templateUrl: 'client/views/chat/chat.ng.html'
			controller: 'ChatController'
			resolve: {currentUser: auth}

		$urlRouterProvider.otherwise '/dashboard'

		return


angular.module('parliva').run do
	<[ 	$rootScope 	$state ]> ++ 
	(	$rootScope, $state ) ->
	
		$rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
			if error == 'AUTH_REQUIRED'
				$state.go 'entrySignIn'
			return
		return
