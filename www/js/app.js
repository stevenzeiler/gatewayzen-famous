var app;

app = angular.module('EB', ['ngRoute', 'ionic']);

app.config(function($routeProvider) {
  $routeProvider
  .when('/login', {
    templateUrl: 'templates/login.html',
    controller: 'LoginController'
  })
  .when('/nav', {
    templateUrl: 'templates/nav.html',
    controller: 'NavController'
  })
  .when('/schedule', {
    templateUrl: 'templates/schedule.html',
    controller: 'ScheduleController'
  })
  .otherwise({
    redirectTo: '/login'
  });
});
