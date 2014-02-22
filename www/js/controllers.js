var app;

app = angular.module('EB');

app.controller('LoginController', function($scope, $location) {
  $scope.facebookLogin = function() {
    console.log('facebookLogin');
  };
});
