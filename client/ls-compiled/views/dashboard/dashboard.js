// Generated by LiveScript 1.4.0
angular.module('angularMeteor').controller('DashboardController', ['$scope', '$meteor'].concat(function($scope, $meteor){
  $scope.state = {
    currentDate: new Date()
  };
  return $scope.open = function($event){
    return $scope.state.opened = true;
  };
}));