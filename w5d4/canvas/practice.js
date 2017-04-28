document.addEventListener("DOMContentLoaded", function(){
  let c = document.getElementById('myCanvas');
  c.height = 500;
  c.width = 500;
  let ctx = c.getContext('2d');

  // draw a rectangle

  ctx.fillStyle = 'rgb(200,0,0)';
  ctx.fillRect(10, 10 , 55, 50);

  // draw a circle

  ctx.beginPath();
  ctx.arc(100, 100, 60, 0, 2 * Math.PI);
  ctx.strokeStyle = 'rgb(0, 0, 200)';
  ctx.fillStyle = 'rgb(0, 0, 200)';
  ctx.lineWidth = 2;
  ctx.stroke();
  ctx.fill();

  // draw a triangle

  ctx.beginPath();
  ctx.moveTo(170, 130);
  ctx.lineTo(170, 160);
  ctx.lineTo(130, 160);
  ctx.fillStyle = 'rgb(0,200,00)';
  ctx.fill();

});
