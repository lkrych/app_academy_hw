let APIUtil = require('./api_util.js');

class TweetCompose{
  constructor(form, tweetFeed){
    this.$form = $(form);
    this.$feed = $(tweetFeed);
    this.setUpListener();
  }

  setUpListener(){
    let $textarea = this.$form.find('textarea');
    $textarea.on('input', this.charCount.bind(this));
    this.$form.on('submit', this.submit.bind(this));
  }

  charCount(){
    let $textarea = this.$form.find('textarea');
    let count = $textarea.val().length;
    let $strong = this.$form.find('strong');
    let input = `Characters left: ${140 - count}`;
    console.log(input);
    $strong.html(input);
  }

  handleSuccess(res) {
    this.clearInput();
    let $tweetLi = this._composeTweetLi(res);
    this.$feed.prepend($tweetLi);
    this.$form.find('input').prop('disabled', false);
  }

  clearInput() {
    this.$form.find('textarea, select').val('');
  }

  submit(event){
    event.preventDefault();
    let data = this.$form.serializeJSON();
    APIUtil.createTweet(data).then(this.handleSuccess.bind(this));
    this.$form.find('input').prop('disabled', true);
  }

  _composeTweetLi(tweet) {
    let user = tweet.user;
    let content = `${tweet.content} -- `;
    let userLink = `<a href="users/${user.id}">${user.username}</a>`;
    let updatedDate = ` -- ${tweet.updated_at}`;
    let $mentionsList = $(`<ul></ul>`);
    for (let i = 0; i < tweet.mentions.length; i++) {
      let mention = tweet.mentions[i];
      let mentionedUser = mention.user;
      let $mentionLi = $(`<li><a href="users/${mentionedUser.id}">${mentionedUser.username}</a></li>`);
      $mentionsList.append($mentionLi);
    }
    let $tweetLi = $(`<li>${content}${userLink}${updatedDate}</li>`);
    $tweetLi.append($mentionsList);
    return $tweetLi;
  }
}

module.exports = TweetCompose;
