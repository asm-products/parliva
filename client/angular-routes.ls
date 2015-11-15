angular.module('angularMeteor').config do
	<[ $urlRouterProvider  $stateProvider  $locationProvider ]> ++ 
	(  $urlRouterProvider, $stateProvider, $locationProvider) ->
	
		$locationProvider.html5Mode true

		auth = <[ $meteor ]> ++ ($meteor) -> $meteor.requireUser!

		$stateProvider

		.state 'home',
			url: '/'
			templateUrl: 'client/views/home/home.ng.html'
			controller: 'HomeController'
			
		.state 'dashboard',
			url: '/dashboard'
			templateUrl: 'client/views/dashboard/dashboard.ng.html'
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
