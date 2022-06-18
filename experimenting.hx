#if sys
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