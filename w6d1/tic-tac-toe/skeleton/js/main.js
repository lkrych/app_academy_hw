const View =  require('./ttt-view');
const Game =  require('../../solution/game');

$( () => {
  const game = new Game();
  const $board = $("figure.ttt");
  const view = new View(game, $board);
  view.bindEvents();
});
