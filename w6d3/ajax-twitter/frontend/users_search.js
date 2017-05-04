const APIUtil = require('./api_util.js');
const FollowToggle = require('./follow_toggle.js');

class UsersSearch {
  constructor(el){
    this.$el = $(el);
    this.input = this.$el.find('input');
    this.ul = this.$el.find('ul');
    this.setupListeners();
  }

  setupListeners() {
    this.$el.on('input', this.handleInput.bind(this));
  }

  renderResults(res) {
    $(this.ul).empty();
    if (res.length === 0) {
      let $none = $(`<li>No matching users.</li>`);
      $(this.ul).append($none);
    }
    for (let i = 0; i < res.length; i++) {
      let user = res[i];
      let $userLi = $(`<li><a href="${user.id}">${user.username}</a></li>`);
      let $userButton = $(`<button type="button"
              name="button"
              class="follow-toggle"
              data-user-id="${user.id}"
              data-initial-follow-state="${user.followed}">
      </button>`);
      $userLi.append($userButton);
      $(this.ul).append($userLi);
      new FollowToggle($userButton);
    }
  }

  handleInput(event) {
    APIUtil.searchUsers(this.input.val(), this.renderResults.bind(this));
  }
}
module.exports = UsersSearch;
