/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(4);
const TweetCompose = __webpack_require__(5)

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


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: (id) => {
    return $.ajax({
      url: `/users/${id}/follow`,
      method: 'post',
      dataType: 'json'
    });
  },

  unfollowUser: (id) => {
    return $.ajax({
      url: `/users/${id}/follow`,
      method: 'delete',
      dataType: 'json'
    });
  },

  searchUsers: (query, success) => {
    return $.ajax({
      url: '/users/search',
      method: 'get',
      dataType: 'json',
      data: {
        query: query
      },
      success: success
    });
  },

  createTweet: (data) => {
    return $.ajax({
      url: '/tweets',
      method: 'post',
      dataType: 'json',
      data: data
    });
  }
}

module.exports = APIUtil;


/***/ }),
/* 3 */,
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);
const FollowToggle = __webpack_require__(1);

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


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

let APIUtil = __webpack_require__(2);

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


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map