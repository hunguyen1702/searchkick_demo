angular.module('app').directive('postedAt', function(){
  return {
    retrict: 'E',
    template: I18n.t('post.posted_at_ng',
      {
        time: '<span am-time-ago="post.updated_at"></span>',
        author_name: '<a ng-href="/author/{{post.author_id}}">{{post.author.name}}</a>'
      })
  }
});
