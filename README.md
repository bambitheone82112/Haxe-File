# Haxe-File
learn about haxe files!
and more to mod your psych engine or kade engine!
if you wanna make a source for your fnf engine, make a folder named this: FNF-Example Mod
inside of it, make again.
inside of it, add source folder and in it, add all haxe files in psych or strident.
if you wanna make a judgement counter to your mod, add this:
1. in playstate.hx, search for public var scoreTxt 

under that, write this: 

var judgementCounter:FlxText;

2.  add(scoreTxt); and write under this:

judgementCounter = new FlxText(20, 0, 0, "", 20); judgementCounter.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK); judgementCounter.borderSize = 2; judgementCounter.borderQuality = 2; judgementCounter.scrollFactor.set(); judgementCounter.cameras = [camHUD]; judgementCounter.screenCenter(Y); judgementCounter.text = 'Sicks: sicks\nGoods:{goods}\nBads: bads\nShits:{shits}\n'; add(judgementCounter);

3 step: write on line 1300 this:

judgementCounter.cameras = [camHUD];

compile the game and done

NOTE: you must be good at programming.
use vs code, vs, notepad, notepad++, thonny for better experience
## if you are a enthusiast programmer, do that.
if you wanna edit the master editor in strident engine, 
do this. 

1. go to mastereditormenu.hx and under var options:Array<String> = [ edit the name of the editor you want.
  
2. go to weekeditorstate.hx under UI_box.selected_tab_id = 'Week';
		add(UI_box);
rename the load week anything you want.
  
3. under 		});
		loadWeekButton.screenCenter(X);
		loadWeekButton.x -= 120;
		add(loadWeekButton);
		
rename freeplay anything you want.
  
 4. under 		});
		freeplayButton.screenCenter(X);
		add(freeplayButton);
	
rename the save week anything you want. 
  
 5. under 		weekFileInputText = new FlxUIInputText(10, weekNameInputText.y + 40, 100, '', 8);
		blockPressWhileTypingOn.push(weekFileInputText);
		reloadWeekThing();
rename hide week from story mode anything you want.
  
 6. under 			weekFile.hideStoryMode = hideCheckbox.checked;
		};
rename everything that under 			weekFile.hideStoryMode = hideCheckbox.checked;
		};
have
  
 7. under 	function addLockUI() {
		var tab_group = new FlxUI(null, UI_box);
		tab_group.name = "Lock";

rename week starts locked anything you want
  
 8. go to all editors and rename it cuz why not?
 
9. compile the game and done
	
## how to rename psych engine app and engine

1. go to project.xml
in line 5, rename psych engine with your engine name.
in mainmenustate.hx, do this: 		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Delusion Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "FNF: Delusion DEMO (Strident Engine V1(DEMO))' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

mine is delusion and rename it as yours :D

## How to make a haxe file using notepad?
	
its very easy.

1. open notepad.
	
2. write a haxe file. example: 		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Delusion Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "FNF: Delusion DEMO (Strident Engine V1(DEMO))' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

3. in the bottom, click it. click all files. name your file. dont forget to add .hx! example: main.hx  now thats how you make it :DDDDDD
	
## How Do i make a test?
do this: #if sys
trace("file system can be accessed");
#end
var content:String = sys.io.File.getContent('my_folder/my_file.txt');
trace(content);

var user = {name:"Mark", age:31};
var content:String = haxe.Json.stringify(user);
sys.io.File.saveContent('my_folder/my_file.json',content);

var location = "path/to/file.txt";
var path = new haxe.io.Path(location);
trace(path.dir); // path/to
trace(path.file); // file
trace(path.ext); // txt

var directory = "path/to/";
var file = "./file.txt";
trace(haxe.io.Path.join([directory, file])); // path/to/file.txt

function recursiveLoop(directory:String = "path/to/") {
  if (sys.FileSystem.exists(directory)) {
    trace("directory found: " + directory);
    for (file in sys.FileSystem.readDirectory(directory)) {
      var path = haxe.io.Path.join([directory, file]);
      if (!sys.FileSystem.isDirectory(path)) {
        trace("file found: " + path);
        // do something with file
      } else {
        var directory = haxe.io.Path.addTrailingSlash(path);
        trace("directory found: " + directory);
        recursiveLoop(directory);
      }
    }
  } else {
    trace('"$directory" does not exists');
  }
}

var stat:sys.FileStat = sys.FileSystem.stat("myFile.txt");
trace("Last access time: " + stat.atime);
trace("Last modification time: " + stat.mtime);
trace("Last status change time: " + stat.ctime);
trace("The user id: " + stat.uid);
trace("File size: " + stat.size);

now thats how you make it:DD

## How do i open haxe file extension?
use notepad ++ or vs code or vs or notepad or thonny or any other text editor idk
	
this is for your project
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
## keep this as a secret
	
this is NOT for your project
