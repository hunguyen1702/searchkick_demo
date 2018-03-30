angular.module('app').controller('PostsController', function($scope, $location, posts){
  var page = $location.search().page;
  var search = $location.search().search;

  posts(page, search).then(function(posts){
    $scope.posts = posts.posts;
    $scope.suggestions = posts.suggestions;
  }, function(error){
    $scope.error = error;
  });
});