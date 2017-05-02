const POSITIONS = {0: [0,0],
                   1: [0,1],
                   2: [0,2],
                   3: [1,0],
                   4: [1,1],
                   5: [1,2],
                   6: [2,0],
                   7: [2,1],
                   8: [2,2]};
class View {

  constructor(game, $el) {
    this.positions = POSITIONS;
    this.game = game;
    this.board = $el;
    this.setupBoard();
  }
  bindEvents() {
    const $listEls = $('li');
    $listEls.on('click', (e) => {
      let $target = $(e.currentTarget);
      if ($target.hasClass('marked')){
        alert("invalid move");
      } else {
        this.makeMove($target);
        this.game.playMove($target.data("pos"));
        if (this.game.isOver()){
          const $h2 = $('<h2></h2>');
          $h2.text(`${this.game.winner()} wins`);
          this.board.append($h2);
          $listEls.off('click');
        }
      }
    });
  }

  makeMove($square) {
    const sym = this.game.currentPlayer;
    $square.addClass('marked');
    $square.append(`<span>${sym}</span>`);
  }

  setupBoard() {
    const $ul = $("<ul></ul>");
    $ul.appendTo(this.board);
    const $listEls = $('li');
    for (var i = 0; i < 9; i++) {
      let $li = $('<li></li>');
      $li.data('pos', this.positions[i]);
      $ul.append($li);
    }
  }
}

module.exports = View;
