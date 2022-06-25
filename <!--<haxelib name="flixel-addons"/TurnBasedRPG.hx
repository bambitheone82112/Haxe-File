 package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint;

using flixel.util.FlxSpriteUtil;

 class HUD extends FlxTypedGroup<FlxSprite>
 {
     var background:FlxSprite;
     var healthCounter:FlxText;
     var moneyCounter:FlxText;
     var healthIcon:FlxSprite;
     var moneyIcon:FlxSprite;

     public function new()
     {
         super();
         background = new FlxSprite().makeGraphic(FlxG.width, 20, FlxColor.BLACK);
         background.drawRect(0, 19, FlxG.width, 1, FlxColor.WHITE);
         healthCounter = new FlxText(16, 2, 0, "3 / 3", 8);
         healthCounter.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
         moneyCounter = new FlxText(0, 2, 0, "0", 8);
         moneyCounter.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
         healthIcon = new FlxSprite(4, healthCounter.y + (healthCounter.height/2)  - 4, AssetPaths.health__png);
         moneyIcon = new FlxSprite(FlxG.width - 12, moneyCounter.y + (moneyCounter.height/2)  - 4, AssetPaths.coin__png);
         moneyCounter.alignment = RIGHT;
         moneyCounter.x = moneyIcon.x - moneyCounter.width - 4;
         add(background);
         add(healthIcon);
         add(moneyIcon);
         add(healthCounter);
         add(moneyCounter);
         forEach(function(sprite) sprite.scrollFactor.set(0, 0));
     }

     public function updateHUD(health:Int, money:Int)
     {
         healthCounter.text = health + " / 3";
         moneyCounter.text = Std.string(money);
         moneyCounter.x = moneyIcon.x - moneyCounter.width - 4;
     }
 }

 enum EnemyType
 {
     REGULAR;
     BOSS;
 }

 class Enemy extends FlxSprite
 {
     static inline var SPEED:Float = 140;

     var type:EnemyType;

     public function new(x:Float, y:Float, type:EnemyType)
     {
         super(x, y);
         this.type = type;
         var graphic = if (type == BOSS) AssetPaths.boss__png else AssetPaths.enemy__png;
         loadGraphic(graphic, true, 16, 16);
         setFacingFlip(LEFT, false, false);
         setFacingFlip(RIGHT, true, false);
         animation.add("d", [0, 1, 0, 2], 6, false);
         animation.add("lr", [3, 4, 3, 5], 6, false);
         animation.add("u", [6, 7, 6, 8], 6, false);
         drag.x = drag.y = 10;
         width = 8;
         height = 14;
         offset.x = 4;
         offset.y = 2;
     }

     override public function update(elapsed:Float)
     {
         if ((velocity.x != 0 || velocity.y != 0) && touching == NONE)
         {
             if (Math.abs(velocity.x) > Math.abs(velocity.y))
             {
                 if (velocity.x < 0)
                     facing = LEFT;
                 else
                     facing = RIGHT;
             }
             else
             {
                 if (velocity.y < 0)
                     facing = UP;
                 else
                     facing = DOWN;
             }

             switch (facing)
             {
                 case LEFT, RIGHT:
                     animation.play("lr");

                 case UP:
                     animation.play("u");

                 case DOWN:
                     animation.play("d");

                 case _:
             }
         }
         super.update(elapsed);
     }
 }

var text = new FlxText(10, 10, 100, "Hello, World!");
 add(text);
 class MenuState extends FlxState
 {
 
  var playButton:FlxButton;
  playButton = new FlxButton(0, 0, "Play", clickPlay);
 add(playButton);
 function clickPlay()
 {
     FlxG.switchState(new PlayState());
 }
 playButton.screenCenter();
 package;

 import flixel.FlxSprite;

 class Player extends FlxSprite
 {
     public function new(x:Float = 0, y:Float = 0)
     {
         super(x, y);
     }
 }
 
  makeGraphic(16, 16, FlxColor.BLUE);
   var player:Player;
 player = new Player(20, 20);
 add(player);
 static inline var SPEED:Float = 200;
  drag.x = drag.y = 1600;
  function updateMovement()
 {
 }
 
  var up:Bool = false;
 var down:Bool = false;
 var left:Bool = false;
 var right:Bool = false;
  up = FlxG.keys.anyPressed([UP, W]);
 down = FlxG.keys.anyPressed([DOWN, S]);
 left = FlxG.keys.anyPressed([LEFT, A]);
 right = FlxG.keys.anyPressed([RIGHT, D]);
  if (up && down)
     up = down = false;
 if (left && right)
     left = right = false;
     if (up || down || left || right)
 {

 }
 
  velocity.x = speed;
 velocity.y = speed;
 var newAngle:Float = 0;
 if (up)
 {
     newAngle = -90;
     if (left)
         newAngle -= 45;
     else if (right)
         newAngle += 45;
 }
 else if (down)
 {
     newAngle = 90;
     if (left)
         newAngle += 45;
     else if (right)
         newAngle -= 45;
 }
 else if (left)
     newAngle = 180;
 else if (right)
     newAngle = 0;
     velocity.set(SPEED, 0);
 velocity.rotate(FlxPoint.weak(0, 0), newAngle);
 updateMovement()
 override update()
 override function update(elapsed:Float)
 {
     updateMovement();
     super.update(elapsed);
 }
 
 loadGraphic(AssetPaths.player__png, true, 16, 16);
 setFacingFlip(LEFT, false, false);
 setFacingFlip(RIGHT, true, false);
 animation.add("lr", [3, 4, 3, 5], 6, false);
 animation.add("u", [6, 7, 6, 8], 6, false);
 animation.add("d", [0, 1, 0, 2], 6, false);
  var newAngle:Float = 0;
 if (up)
 {
     newAngle = -90;
     if (left)
         newAngle -= 45;
     else if (right)
         newAngle += 45;
     facing = UP;
 }
 else if (down)
 {
     newAngle = 90;
     if (left)
         newAngle += 45;
     else if (right)
         newAngle -= 45;
     facing = DOWN;
 }
 else if (left)
 {
     newAngle = 180;
     facing = LEFT;
 }
 else if (right)
 {
     newAngle = 0;
     facing = RIGHT;
 }

 // determine our velocity based on angle and speed
 velocity.set(SPEED, 0);
 velocity.rotate(FlxPoint.weak(0, 0), newAngle);

 // if the player is moving (velocity is not 0 for either axis), we need to change the animation to match their facing
 if ((velocity.x != 0 || velocity.y != 0) && touching == NONE) 
 {
     switch (facing)
     {
         case LEFT, RIGHT:
             animation.play("lr");
         case UP:
             animation.play("u");
         case DOWN:
             animation.play("d");
         case _:
     }
 }
 
  var map:FlxOgmo3Loader;
 var walls:FlxTilemap;
  map = new FlxOgmo3Loader(AssetPaths.turnBasedRPG__ogmo, AssetPaths.room_001__json);
 walls = map.loadTilemap(AssetPaths.tiles__png, "walls");
 walls.follow();
 walls.setTileProperties(1, NONE);
 walls.setTileProperties(2, ANY);
 add(walls);
 player = new Player(20, 20);
  player = new Player();
 map.loadEntities(placeEntities, "entities");
  function placeEntities(entity:EntityData)
 {
     if (entity.name == "player")
     {
         player.setPosition(entity.x, entity.y);
     }
 }
 
FlxG.collide(player, walls);
setSize(8, 8);
 offset.set(4, 4);
 FlxG.camera.follow(player, TOPDOWN, 1);
  package;

 import flixel.FlxSprite;

 class Coin extends FlxSprite
 {
     public function new(x:Float, y:Float) 
     {
         super(x, y);
         loadGraphic(AssetPaths.coin__png, false, 8, 8);
     }
 }
 
 var coins:FlxTypedGroup<Coin>;
 coins = new FlxTypedGroup<Coin>();
 add(coins);
  else if (entity.name == "coin")
 {
     coins.add(new Coin(entity.x + 4, entity.y + 4));
 }
 
 FlxG.overlap(player, coins, playerTouchCoin);
 function playerTouchCoin(player:Player, coin:Coin)
{
    if (player.alive && player.exists && coin.alive && coin.exists)
    {
        coin.kill();
    }
}

override function kill()
{
    alive = false;
    FlxTween.tween(this, {alpha: 0, y: y - 16}, 0.33, {ease: FlxEase.circOut, onComplete: finishKill});
}

function finishKill(_)
{
    exists = false;
}

 enum EnemyType
 {
     REGULAR;
     BOSS;
 }
 
 var enemies:FlxTypedGroup<Enemy>;
 enemies = new FlxTypedGroup<Enemy>();
 add(enemies);
 else if (entity.name == "enemy")
 {
     enemies.add(new Enemy(entity.x + 4, entity.y, REGULAR));
 }
 else if (entity.name == "boss")
 {
     enemies.add(new Enemy(entity.x + 4, entity.y, BOSS));
 }
 
  var x = entity.x;
 var y = entity.y;

 switch (entity.name)
 {
     case "player":
         player.setPosition(x, y);

     case "coin":
         coins.add(new Coin(x + 4, y + 4));

     case "enemy":
         enemies.add(new Enemy(x + 4, y, REGULAR));

     case "boss":
         enemies.add(new Enemy(x + 4, y, BOSS));
 }
 
  class FSM
 {
     public var activeState:Float->Void;

     public function new(initialState:Float->Void)
     {
         activeState = initialState;
     }

     public function update(elapsed:Float)
     {
         activeState(elapsed);
     }
 }
 
 var brain:FSM;
 var idleTimer:Float;
 var moveDirection:Float;
 var seesPlayer:Bool;
 var playerPosition:FlxPoint;
  brain = new FSM(idle);
 idleTimer = 0;
 playerPosition = FlxPoint.get();
  function idle(elapsed:Float)
 {
     if (seesPlayer)
     {
         brain.activeState = chase;
     }
     else if (idleTimer <= 0)
     {
         if (FlxG.random.bool(1))
         {
             moveDirection = -1;
             velocity.x = velocity.y = 0;
         }
         else
         {
             moveDirection = FlxG.random.int(0, 8) * 45;

             velocity.set(SPEED * 0.5, 0);
             velocity.rotate(FlxPoint.weak(), moveDirection);

         }
         idleTimer = FlxG.random.int(1, 4);            
     }
     else
         idleTimer -= elapsed;

 }

 function chase(elapsed:Float)
 {
     if (!seesPlayer)
     {
         brain.activeState = idle;
     }
     else
     {
         FlxVelocity.moveTowardsPoint(this, playerPosition, Std.int(SPEED));
     }
 }
 
  brain.update(elapsed);
  FlxG.collide(enemies, walls);
 enemies.forEachAlive(checkEnemyVision);
 function checkEnemyVision(enemy:Enemy)
 {
     if (walls.ray(enemy.getMidpoint(), player.getMidpoint()))
     {
         enemy.seesPlayer = true;
         enemy.playerPosition = player.getMidpoint();
     }
     else
     {
         enemy.seesPlayer = false;
     }
 }
 
public var seesPlayer:Bool;
public var playerPosition:FlxPoint;
var hud:HUD;
var money:Int = 0;
 hud = new HUD();
 add(hud);
  money++;
 hud.updateHUD(health, money);
public function changeType(type:EnemyType)
 {
     if (this.type != type)
     {
         this.type = type;
         var graphic = if (type == BOSS) AssetPaths.boss__png else AssetPaths.enemy__png;
         loadGraphic(graphic, true, 16, 16);
     }
 }
 
var inCombat:Bool = false;
var combatHud:CombatHUD;
combatHud = new CombatHUD();
add(combatHud);
if (inCombat)
 {
     if (!combatHud.visible)
     {
         health = combatHud.playerHealth;
         hud.updateHUD(health, money);
         if (combatHud.outcome == VICTORY)
         {
             combatHud.enemy.kill();
         }
         else
         {
             combatHud.enemy.flicker();
         }
         inCombat = false;
         player.active = true;
         enemies.active = true;
     }
 }
 else
 {
     FlxG.collide(player, walls);
     FlxG.overlap(player, coins, playerTouchCoin);
     FlxG.collide(enemies, walls);
     enemies.forEachAlive(checkEnemyVision);
     FlxG.overlap(player, enemies, playerTouchEnemy);
 }
 
 using flixel.util.FlxSpriteUtil;
  function playerTouchEnemy(player:Player, enemy:Enemy)
 {
     if (player.alive && player.exists && enemy.alive && enemy.exists && !enemy.isFlickering())
     {
         startCombat(enemy);
     }
 }

 function startCombat(enemy:Enemy)
 {
     inCombat = true;
     player.active = false;
     enemies.active = false;
     combatHud.initCombat(health, enemy);
 }
 
var health:Int = 3;
if (this.isFlickering())
     return;
using flixel.util.FlxSpriteUtil;
var ending:Bool;
var won:Bool;
 if (ending)
 {
     return;
 }
 
if (!combatHud.visible)
 {
     health = combatHud.playerHealth;
     hud.updateHUD(health, money);
     if (combatHud.outcome == DEFEAT)
     {
         ending = true;
         FlxG.camera.fade(FlxColor.BLACK, 0.33, false, doneFadeOut);
     }
     else
     {
         if (combatHud.outcome == VICTORY)
         {
             combatHud.enemy.kill();
             if (combatHud.enemy.type == BOSS)
             {
                 won = true;
                 ending = true;
                 FlxG.camera.fade(FlxColor.BLACK, 0.33, false, doneFadeOut);
             }
         }
         else
         {
             combatHud.enemy.flicker();
         }
         inCombat = false;
         player.active = true;
         enemies.active = true;
     }
 }
 
 function doneFadeOut()
 {
     FlxG.switchState(new GameOverState(won, money));
 }

 var titleText:FlxText;
 var optionsButton:FlxButton;
 titleText = new FlxText(20, 0, 0, "HaxeFlixel\nTutorial\nGame", 22);
 titleText.alignment = CENTER;
 titleText.screenCenter(X);
 add(titleText);

 playButton = new FlxButton(0, 0, "Play", clickPlay);
 playButton.x = (FlxG.width / 2) - playButton.width - 10;
 playButton.y = FlxG.height - playButton.height - 10;
 add(playButton);

 optionsButton = new FlxButton(0, 0, "Options", clickOptions);
 optionsButton.x = (FlxG.width / 2) + 10;
 optionsButton.y = FlxG.height - optionsButton.height - 10;
 add(optionsButton);
 
  function clickOptions()
 {
     FlxG.switchState(new OptionsState());
 }
 
  var save = new FlxSave();
 save.bind("TurnBasedRPG");
 if (save.data.volume != null)
 {
     FlxG.sound.volume = save.data.volume;
 }
 save.close();
 
 if (FlxG.sound.music == null) // don't restart the music if it's already playing
 {
     FlxG.sound.playMusic(AssetPaths.HaxeFlixel_Tutorial_Game__ogg, 1, true);
 }
 
 playButton.onUp.sound = FlxG.sound.load(AssetPaths.select__wav);
 var stepSound:FlxSound;
 stepSound = FlxG.sound.load(AssetPaths.step__wav);
 stepSound.play();
 var stepSound:FlxSound;
 stepSound = FlxG.sound.load(AssetPaths.step__wav, 0.4);
 stepSound.proximity(x, y, FlxG.camera.target, FlxG.width * 0.6);
 if ((velocity.x != 0 || velocity.y != 0) && touching == NONE)
{
    stepSound.setPosition(x + frameWidth / 2, y + height);
    stepSound.play();
}

var coinSound:FlxSound
coinSound = FlxG.sound.load(AssetPaths.coin__wav);
coinSound.play(true);
var fledSound:FlxSound;
var hurtSound:FlxSound;
var loseSound:FlxSound;
var missSound:FlxSound;
var selectSound:FlxSound;
var winSound:FlxSound;
var combatSound:FlxSound;
fledSound = FlxG.sound.load(AssetPaths.fled__wav);
hurtSound = FlxG.sound.load(AssetPaths.hurt__wav);
loseSound = FlxG.sound.load(AssetPaths.lose__wav);
missSound = FlxG.sound.load(AssetPaths.miss__wav);
selectSound = FlxG.sound.load(AssetPaths.select__wav);
winSound = FlxG.sound.load(AssetPaths.win__wav);
combatSound = FlxG.sound.load(AssetPaths.combat__wav);
combatSound.play();
selectSound.play();
selectSound.play();
hurtSound.play();
missSound.play();
fledSound.play();
hurtSound.play();
enemyAttack()
missSound.play();
loseSound.play()
winSound.play();
 #if desktop
 var fullscreenButton:FlxButton;
 #end
  #if desktop
 fullscreenButton = new FlxButton(0, volumeBar.y + volumeBar.height + 8, FlxG.fullscreen ? "FULLSCREEN" : "WINDOWED", clickFullscreen);
 fullscreenButton.screenCenter(X);
 add(fullscreenButton);
 #end
 #if desktop
 function clickFullscreen()
 {
     FlxG.fullscreen = !FlxG.fullscreen;
     fullscreenButton.text = FlxG.fullscreen ? "FULLSCREEN" : "WINDOWED";
     save.data.fullscreen = FlxG.fullscreen;
 }
 #end
 
 var startFullscreen:Bool = false;
 var save:FlxSave = new FlxSave();
 save.bind("TurnBasedRPG");
 #if desktop
 if (save.data.fullscreen != null)
 {
     startFullscreen = save.data.fullscreen;
 }
 #end

 super();
 addChild(new FlxGame(320, 240, MenuState, 1, 60, 60, false, startFullscreen));

 if (save.data.volume != null)
 {
     FlxG.sound.volume = save.data.volume;
 }
 save.close();
 
  #if desktop
 var exitButton:FlxButton;
 #end
  #if desktop
 exitButton = new FlxButton(FlxG.width - 28, 8, "X", clickExit);
 exitButton.loadGraphic(AssetPaths.button__png, true, 20, 20);
 add(exitButton);
 #end
  #if desktop
 function clickExit()
 {
     Sys.exit(0);
 }
 #end
 #if mobile
 public static var virtualPad:FlxVirtualPad;
 #end
 #if mobile
 virtualPad = new FlxVirtualPad(FULL, NONE);
 add(virtualPad);
 #end
  #if mobile
 virtualPad.visible = false;
 #end
  #if mobile
 virtualPad.visible = true;
 #end
 #if FLX_KEYBOARD
 up = FlxG.keys.anyPressed([UP, W]);
 down = FlxG.keys.anyPressed([DOWN, S]);
 left = FlxG.keys.anyPressed([LEFT, A]);
 right = FlxG.keys.anyPressed([RIGHT, D]);
 #end
 #if mobile
 var virtualPad = PlayState.virtualPad;
 up = up || virtualPad.buttonUp.pressed;
 down = down || virtualPad.buttonDown.pressed;
 left  = left || virtualPad.buttonLeft.pressed;
 right = right || virtualPad.buttonRight.pressed;
 #end
 #if FLX_KEYBOARD
 ...
 #end
 updateTouchInput();
 function updateTouchInput()
 {
     #if FLX_TOUCH
     for (touch in FlxG.touches.justReleased())
     {
         for (choice in choices.keys())
         {
             var text = choices[choice];
             if (touch.overlaps(text))
             {
                 selectSound.play();
                 selected = choice;
                 movePointer();
                 makeChoice();
                 return;
             }
         }
     }
     #end
 }
 
 FlxG.camera.fade(FlxColor.BLACK, 0.33, true);
 FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
{
    FlxG.switchState(new PlayState());
});
FlxG.camera.shake(0.01, 0.2);
FlxTween.tween(enemySprite, {x: enemySprite.x + 4}, 0.1, {
    onComplete: function(_)
    {
        FlxTween.tween(enemySprite, {x: enemySprite.x - 4}, 0.1);
    }
});
var screen:FlxSprite;
 screen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
 var waveEffect = new FlxWaveEffect(FlxWaveMode.ALL, 4, -1, 4);
 var waveSprite = new FlxEffectSprite(screen, [waveEffect]);
 add(waveSprite);
 screen.drawFrame();
 var screenPixels = screen.framePixels;

 if (FlxG.renderBlit)
     screenPixels.copyPixels(FlxG.camera.buffer, FlxG.camera.buffer.rect, new Point());
 else
     screenPixels.draw(FlxG.camera.canvas, new Matrix(1, 0, 0, 1, 0, 0));

 var rc:Float = 1 / 3;
 var gc:Float = 1 / 2;
 var bc:Float = 1 / 6;
 screenPixels.applyFilter(screenPixels, screenPixels.rect, new Point(), new ColorMatrixFilter([rc, gc, bc, 0, 0, rc, gc, bc, 0, 0, rc, gc, bc, 0, 0, 0, 0, 0, 1, 0]));
 #if FLX_MOUSE
FlxG.mouse.visible = false;
#end
