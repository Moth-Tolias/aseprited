import std.stdio;
import std.string;
import std.file;
import std.json;
import geometry.rectangle;
//import std.conv;
//import std.exception;

void main()
{
	auto fileString = fileContents("rotate_png.json");
	auto jsonTree = parseJSON(fileString);

	//writeln(jsonTree.type);
}

struct Frame
{
	string filename;
	Rectangle bounds;
}

/*class Grammar
{
	Symbol[string] symbols;

	this(JSONValue jsonValue)
	{
		enforce(jsonValue.type == JSONType.object, "input must be valid json");
		foreach (key, value; jsonValue.object)
		{
			symbols[key] = new Symbol(value, this);
		}

	}

	string createFlattened(string symbolID = "origin")
	{
		//auto trace = new Trace(symbolID);

		//auto rnd = Random(unpredictableSeed);

		char[] result;
		size_t num = uniform(0, this.symbols[symbolID].rules.length);

		foreach (value; this.symbols[symbolID].rules[num].tokens)
		{
			if (value.isLiteral)
			{
				result ~= value.data;
			} else {
				result ~= createFlattened(value.data);
			}
		}

		return result.idup;
	}

}*/

/*class Symbol
{
	Rule[] rules;
	Grammar parent;

	this(JSONValue jsonValue, Grammar parent)
	{

		this.parent = parent;

		enforce(jsonValue.type == JSONType.array, "input must comply to the tracery spec: symbol is not an array");
		foreach (value; jsonValue.array)
		{
			enforce(value.type == JSONType.string, "input must comply to the tracery spec: rule is not a string");
			dstring ruleString = dtext(value.str);
			dchar[] currentToken;

			Token[] tokens;

			bool hashOpen = false;

			foreach (c; ruleString)
			{
				if (c == '#')
				{
					hashOpen = !hashOpen;
					if (currentToken.length > 0)
					{
						if (hashOpen == false)
						{
							tokens ~= Token(text(currentToken), false);
							currentToken.length = 0;
						} else {
							tokens ~= Token(text(currentToken), true);
							currentToken.length = 0;
						}
					}
					continue;
				}
				currentToken ~= c;
			}

			if (currentToken.length > 0)
			{
				tokens ~= Token(text(currentToken), true);
			}

			rules ~= new Rule(tokens, this);
		}

	}
}

class Rule
{
	Token[] tokens;
	Symbol parent;

	this(Token[] tokens, Symbol parent)
	{
		this.tokens = tokens;
		this.parent = parent;
	}
}

struct Token
{
	string data;
	bool isLiteral;
}
*/

string fileContents(string filename)
{
	char[] result;

	if (!exists(filename))
	{
		//throw
	}
	auto file = File(filename, "r");
	while (!file.eof())
	{
		result ~= file.readln();
	}

	return result.idup;
}
