var app;

app = angular.module('EB', ['ngRoute', 'ionic']);

app.config(function($routeProvider) {
  $routeProvider.when('/', {
    templateUrl: 'templates/login.html',
    controller: 'LoginController'
  });
});
