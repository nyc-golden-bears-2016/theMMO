var FRAME_RATE = 100;
var your_username = "";


var uri = "wss://" + window.document.location.host + "/";
var wSocket = new WebSocket(uri);
console.log(wSocket);

var Character = function Character(){
  this.pos_x = 0;
  this.pos_y = 0;
};

your_char = new Character;

var otherPlayers = {};
var playerNames = [];


var updateCharacters = function(){
  if(wSocket.readyState === 1) {
    wSocket.send( JSON.stringify({pos_x: your_char.pos_x, pos_y: your_char.pos_y, username: your_username}) );
  };
};
wSocket.onmessage = function(response) {
  var data = JSON.parse(response.data);
  console.log(data.username + " " + data.pos_x + " " + data.pos_y);

  // if username is not found, add it to existing users
  if (playerNames.indexOf(data.username) === -1) {
    playerNames.push(data.username);
    // initialize an object to store this player's info
    otherPlayers[data.username] = new Character;
  }
  otherPlayers[data.username].pos_x = data.pos_x;
  otherPlayers[data.username].pos_y = data.pos_y;
};

wSocket.onclose = function(response) {
  console.log("closed!!!")
};



var allowInput = function() {
  $(document).keydown(function(e){
    e.preventDefault();
  });
  $(document).keyup(function(e){
    e.preventDefault();
    if (e.which === 38) {
      your_char.pos_y--;
    };
    if (e.which === 40) {
      your_char.pos_y++;
    };
    if (e.which === 37) {
      your_char.pos_x--;
    };
    if (e.which === 39) {
      your_char.pos_x++;
    };
  });
};

var setCharacterUpdate = function(username) {
    your_username = username;
    setInterval(updateCharacters, FRAME_RATE);
};

var drawCharacter = function(character, context){
  context.beginPath();
  context.moveTo(character.pos_x, character.pos_y);
  context.lineTo(character.pos_x + 25, character.pos_y + 25);
  context.lineTo(character.pos_x + 25, character.pos_y - 25);
  context.fill();
};


var drawGame = function(){
  var canvas = document.getElementById('game_screen');
  var context = canvas.getContext('2d');
  context.clearRect(0, 0, canvas.width, canvas.height);

  context.fillStyle = "black";
  for (var i = playerNames.length - 1; i >= 0; i--) {
    drawCharacter(otherPlayers[playerNames[i]], context);
  };

  context.fillStyle = "green";
  drawCharacter(your_char, context);
};

var setCanvasDrawingUpdate = function(){
  setInterval(drawGame, FRAME_RATE);
};
