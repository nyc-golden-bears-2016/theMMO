var uri = "ws://" + window.document.location.host + "/";
var wSocket = new WebSocket(uri);
console.log(wSocket);
$('document').ready(function(){
  $("#register").append("<p>Hey</p>");
  $("p").click(function(){
    wSocket.send( JSON.stringify({name: "Howard", position: "1,20"}) );
  });
  wSocket.onmessage = function(response) {
    var data = JSON.parse(response.data);
    console.log(data.position);
  };
});
