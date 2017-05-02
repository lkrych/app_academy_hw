class View{

  constructor(game,dom){
    this.game = game;
    this.dom = dom;
    this.setupTowers();
    // this.render();
    this.clickTower();
  }

  setupTowers(){
    for (var i = 0; i < 3; i++) {
      const $ulList = $('<ul></ul>');
      $ulList.data('idx', i);
      this.dom.append($ulList);
    }
    const $firstUl = $('ul').first();
    for (var i = 0; i < 3; i++) {
      const $li = $('<li></li>');
      $li.addClass(`size-${i}`);
      $firstUl.append($li);
    }
  }

  render(towerOne, towerTwo){
    let disc = towerOne.children().first();
    disc.detach();
    disc.prependTo(towerTwo);
    if(this.game.isWon()){
      let $h2 = $('<h2 class = "color_of_enlightenment"> You won! Congratulations. You\'ve reached enlightenment</h2>');
      this.dom.append($h2);
      const $ulList = $('ul');
      $ulList.off('click');
      $('body').addClass('enlightenment');
      for (var i = 0; i < 100; i++) {
        let $marquee = $('<marquee class = "color_of_enlightenment">Congratulations, You\'ve reached enlightenment</marquee>');
        setTimeout(() => {this.dom.append($marquee)},1000);
        }
    }
  }

  clickTower(){
    const $ulList = $('ul');
    let towerOne = null;
    let towerTwo = null;
    $ulList.on('click', (e) => {
      const $tower = $(e.currentTarget);
      if (towerOne === null){
        towerOne = $tower;
        $tower.addClass('selected');
      } else {
        towerTwo = $tower;
        const move = this.game.move(towerOne.data('idx'), towerTwo.data('idx'));
        if (move){
          towerOne.removeClass('selected');
          this.render(towerOne, towerTwo);
          towerOne = null;
          towerTwo = null;
        } else {

          alert("invalid move");
        }
      }
    });
  }
}


module.exports = View;
