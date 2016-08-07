var uri = "ws://" + window.document.location.host + "/";
var wSocket = new WebSocket(uri);
console.log(wSocket);

var print_stuff = function(stuff){
  console.log(stuff);
}

var Character = function Character(){
  this.pos_x = 0;
  this.pos_y = 0;
};

your_char = new Character;


var updateCharacters = function(){
  wSocket.send( JSON.stringify({pos_x: your_char.pos_x, pos_y: your_char.pos_y}) );
};
wSocket.onmessage = function(response) {
  var data = JSON.parse(response.data);
  console.log(data.pos_x + " " + data.pos_y);
};

var allowInput = function() {
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

var setCharacterUpdate = function() {
    setInterval(updateCharacters, 100);
};

