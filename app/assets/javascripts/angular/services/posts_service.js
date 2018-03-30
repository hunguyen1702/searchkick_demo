angular.module('app').factory('posts', function($q, $http){
  return function(page, search){
    var def = $q.defer();

    $http({method: 'GET', url: '/posts.json?page=' + page + '&search=' + search})
      .then(function(response){
        def.resolve(response.data);
      }, function(response){
        def.reject(response.status + " " + response.data.error);
      });
    window.ajax_loading = true;
    return def.promise;
  }
});
