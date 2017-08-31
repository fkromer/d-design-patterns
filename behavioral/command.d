#!/usr/bin/env rdmd
/+
dub.json:
{
    "name": "command"
}
+/

import std.stdio;
import std.file;
import std.algorithm;

class MoveFileCommand
{
private:
    string source;
    string destination;
    void action(string source, string destination)
    {
        writefln("renaming %s to %s", source, destination);
        rename(source, destination);
    }
public:
    this(string source, string destination)
    {
        this.source = source;
        this.destination = destination;
    }
    void execute()
    {
        this.action(source, destination);
    }
    void undo()
    {
        this.action(this.destination, this.source);
    }
}

void main()
{
    MoveFileCommand[] commandStack;
    auto firstCommand = new MoveFileCommand("foo.txt", "bar.txt");
    auto secondCommand = new MoveFileCommand("bar.txt", "baz.txt");
    commandStack ~= firstCommand;
    commandStack ~= secondCommand;
    assert(exists("foo.txt") == false);
    auto file = File("foo.txt", "w");
    foreach(command; commandStack)
    {
        command.execute();
    }
    reverse(commandStack);
    foreach(command; commandStack)
    {
        command.undo();
    }
    std.file.remove("foo.txt");
}
