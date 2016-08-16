
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
  this.defense = 1;
  this.enemyTarget = 0;

  // cool down time before player can use an item again
  this.recoveryTime = 0;
  this.inventory = [];
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

