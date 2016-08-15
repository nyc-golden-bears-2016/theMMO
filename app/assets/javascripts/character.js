console.log("CHARACTER PAGE LOADING")
var Character = function Character(){
  this.pos_x = 0;
  this.pos_y = 0;
  this.speed = 4;

  this.health = 100;
  this.max_health = 100;
  this.attack = 10;
  this.xp = 0;
  this.defense = 1;
  this.enemyTarget = 0;
  this.inventory = [];
};

Character.prototype.attackEnemy = function(enemy) {
  enemy.health -= this.attack
}

Character.prototype.changeTarget = function(enemy) {
  this.enemyTarget = enemy;
}
