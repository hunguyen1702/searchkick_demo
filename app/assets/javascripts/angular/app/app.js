(function (){
  var app = angular.module('app', ['angularMoment']);

  app.config(function($locationProvider){
    $locationProvider.html5Mode(true);
  });
})();
