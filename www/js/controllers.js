var app;

app = angular.module('EB');

app.controller('LoginController', function($scope, $location) {
  $scope.facebookLogin = function(){
    $location.path('/nav');
  }
});

app.controller('NavController', function($scope, $location) {
  $scope.logout = function(){
    $location.path('/login');
  }
  $scope.redirect = function(path) {
    $location.path('/' + path);
  }
  // $scope.watchVideos = function() {
  //   $location.path('/videos')
  // }
  // $scope.bookMassage = function() {
  //   $location.path('/massage')
  // }
  // $scope.donate = function() {
  //   $location.path('/donate')
  // }
  // $scope.sendMessage = function() {
  //   $location.path('/message')
  // }
  $scope.leftButtons = [
    { 
      type: 'button-positive',
      content: '<i class="icon ion-android-hand"></i>',
      tap: function(e) {
        $scope.logout();
      }
    }
  ];
  $scope.navLinks = [
    {
      verb: "Yoga Schedule",
      href: "schedule",
      image: "schedule_icon"
    },
    {
      verb: "Media",
      href: "media",
      image: "video_icon"
    },
    {
      verb: "Massage",
      href: "massage",
      image: "massage_icon"
    },
    {
      verb: "Donate",
      href: "donate",
      image: "donate_icon"
    },
    {
      verb: "Message",
      href: "message",
      image: "message_icon"
    }
  ];
});

app.controller('ScheduleController', function($scope, $http, $location) {
  $scope.getClasses = function(){
    $http.get('http://energiesbalanced.herokuapp.com/api/yoga_classes')
         .success(function(data){
           $scope.classes = data;
         })
         .error(function(err){
           console.log(err);
         });
  }

  $scope.logout = function(){
    $location.path('/login');
  }

  $scope.getClasses();
})

