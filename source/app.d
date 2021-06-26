import std.stdio;
import std.string;
import std.file;
import std.json;
import geometry.rectangle;
//import std.exception;

void main()
{
	writeln(parseAsepriteJSON("rotate_png.json"));
}

Frame[] parseAsepriteJSON(in string path)
{
	Frame[] result;

	auto fileString = fileContents(path);
	auto jsonTree = parseJSON(fileString);

	foreach(jsonFrame; jsonTree["frames"].array)
	{
		Frame f;
		f.filename = jsonFrame["filename"].str.split[0] ~ ".png"; //remove "N .gif" and append actual extension
		f.bounds = jsonToRectangle(jsonFrame["frame"]);
		result ~= f;
	}

	return result;
}

struct Frame
{
	string filename;
	Rectangle bounds;
}

private string fileContents(in string filename)
{
	char[] result;

	if (!exists(filename))
	{
		// todo: throw
	}
	auto file = File(filename, "r");
	while (!file.eof())
	{
		result ~= file.readln();
	}

	return result.idup;
}

private Rectangle jsonToRectangle(in JSONValue jsonRect) @safe pure
{
	Rectangle r;
	r.x = jsonRect["x"].get!(int);
	r.y = jsonRect["y"].get!(int);
	r.w = jsonRect["w"].get!(int);
	r.h = jsonRect["h"].get!(int);

	return r;
}
