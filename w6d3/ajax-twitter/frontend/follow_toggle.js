const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.setupListener();
    this.render();
  }

  render(){
    if(this.followState){
      this.$el.text("Unfollow!");
    } else{
      this.$el.text("Follow!");
    }
    this.$el.prop('disabled', false);
  }

  setupListener() {
    this.$el.on('click', this.handleClick.bind(this));
  }

  handleClick(event){
    event.preventDefault();
    let request = this.followState
      ? APIUtil.unfollowUser(this.userId)
      : APIUtil.followUser(this.userId);
    request.then(response => this.followState = !this.followState)
           .then(this.render.bind(this));
    this.$el.prop('disabled', true);
  }
}

module.exports = FollowToggle;
