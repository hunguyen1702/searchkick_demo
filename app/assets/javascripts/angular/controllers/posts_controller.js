angular.module('app').controller('PostsController', function($scope, $location, posts){
  var search = $location.search().search;
  $scope.query = '';

  $scope.search = function(search){
    posts(search).then(function(posts){
      $scope.allPosts = posts.posts;
      $scope.suggestions = posts.suggestions;
      $scope.totalItems = $scope.allPosts.length;
      $scope.currentPage = 1;
      $scope.itemsPerPage = 8;
      $scope.maxSize = 5;

      $scope.$watch("currentPage", function(){
        setPagingData($scope.currentPage);
      });

      $scope.setPage = function (pageNo) {
        $scope.currentPage = pageNo;
      };

      function setPagingData(page){
        $scope.posts = $scope.allPosts.slice(
          (page - 1) * $scope.itemsPerPage,
          page * $scope.itemsPerPage
        );
      }
    }, function(error){
      $scope.error = error;
    });
  };

  $scope.search(search);
});
