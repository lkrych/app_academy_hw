const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');
const TweetCompose = require('./tweet_compose.js')

$(() => {
  let $followButtons = $('button.follow-toggle');
  $followButtons.each(function construct(index, el) {
    new FollowToggle(el);
  });

  let $users = $('nav.users-search');
  $users.each(function construct(index, el) {
    new UsersSearch(el);
  });

  let $tweetsform = $('form.tweet-compose');
  let $tweetsfeed = $('#feed');
  $tweetsform.each(function construct(index, el) {
    new TweetCompose(el, $tweetsfeed);
  });

});
