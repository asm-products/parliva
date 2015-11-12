angular.module('angularMeteor').config do
	<[ $urlRouterProvider  $stateProvider  $locationProvider ]> ++ 
	(  $urlRouterProvider, $stateProvider, $locationProvider) ->
	
		$locationProvider.html5Mode true

		auth = <[ $meteor ]> ++ ($meteor) -> $meteor.requireUser!

		$stateProvider

		.state 'entrySignIn', url: '/sign-in', template: '<meteor-include src="entrySignIn"></meteor-include>'
		.state 'entrySignUp', url: '/sign-up', template: '<meteor-include src="entrySignUp"></meteor-include>'

		.state 'home',
			url: '/'
			templateUrl: 'client/views/home/home.html'
			controller: 'HomeController'
			
		.state 'dashboard',
			url: '/dashboard'
			templateUrl: 'client/views/dashboard/dashboard.html'
			controller: 'DashboardController'
			resolve: {currentUser: auth}

		$urlRouterProvider.otherwise '/'

		return


angular.module('angularMeteor').run do
	<[ 	$rootScope 	$state ]> ++
	(	$rootScope, $state ) ->
	
		$rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
			if error == 'AUTH_REQUIRED'
				$state.go 'entrySignIn'
			return
		return
