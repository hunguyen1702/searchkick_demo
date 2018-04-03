(function (){
  var app = angular.module('app', ['angularMoment', 'ui.bootstrap']);

  app.config(function($locationProvider){
    $locationProvider.html5Mode(true);
  });
})();
