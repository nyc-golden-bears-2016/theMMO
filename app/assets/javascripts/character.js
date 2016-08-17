
console.log("CHARACTER PAGE LOADING")

var knight_north = [knight_north01, knight_north02, knight_north01, knight_north03];
var knight_south = [knight_south01, knight_south02, knight_south01, knight_south03];
var knight_east = [knight_east01, knight_east02];
var knight_west = [knight_west01, knight_west02];

var Character = function Character(name){
  this.name = name;

  this.direction = "south";
  this.framesPassed = 0;
  this.animationFrame = 0;
  this.turnedThisFrame = false;

  this.pos_x = 0;
  this.pos_y = 0;
  this.speed = 4;

  this.health = 100;
  this.max_health = 100;
  this.attack = 10;
  this.xp = 0;
  this.level = 1;
  this.defense = 1;
  this.enemyTarget = 0;

  // cool down time before player can use an item again
  this.recoveryTime = 0;
  this.inventory = [];
  this.statusEffects = [];
};

Character.prototype.attackEnemy = function(enemy) {
  enemy.health -= this.attack;
}

Character.prototype.changeTarget = function(enemy) {
  this.enemyTarget = enemy;
}

Character.prototype.faceDirection = function(direction) {
  if(this.turnedThisFrame === false) {
    if(this.direction !== direction) {
      this.animationFrame = 0;
      this.framesPassed = 0;
    };
    this.direction = direction;
  }
}

Character.prototype.processStatusEffects = function() {
  var curEffects = this.statusEffects.slice(0);
  for (var i = curEffects.length - 1; i >= 0; i--) {
    if(curEffects[i].framesPassed > curEffects[i].duration) {
      curEffects[i].deactivate();
      this.statusEffects.splice(this.statusEffects.indexOf(curEffects[i]), 1);
    }
  };
  for (var i = this.statusEffects.length - 1; i >= 0; i--) {
    this.statusEffects[i].framesPassed++;
  };
}

var StatusEffect = function StatusEffect(name) {
  this.name = name;
  this.duration = 0;
  this.framesPassed = 0;
  if(name === "honey grahams") {
    this.duration = 300;
  } else if(name === "subway pizza") {
    this.duration = 120;
  }
}

StatusEffect.prototype.deactivate = function() {
  if(this.name === "honey grahams") {
    your_char.speed -= 4;
  } else if(this.name === "subway pizza") {
    your_char.attack -= Math.floor(your_char.attack * 0.2);
  };
}


function showValue(newValue)
{
  document.getElementById("range").innerHTML=newValue;
}

function showValue1(newValue1)
{
  document.getElementById("range1").innerHTML=newValue1;

}

function showValue2(newValue2)
{
  document.getElementById("range2").innerHTML=newValue2;

}

function showValue3(newValue3)
{
  document.getElementById("range3").innerHTML=newValue3;

}
