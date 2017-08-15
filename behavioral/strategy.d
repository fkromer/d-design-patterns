#!/usr/bin/env rdmd
import std.stdio;

interface Strategy
{
public:
    void execute();
}

class FirstStrategy : Strategy
{
protected:
    string strategyName = "First strategy";
public:
    void execute()
    {
        writeln(strategyName, " executes");
    }
}

class SecondStrategy : Strategy
{
protected:
    string strategyName = "Second strategy";
public:
    void execute()
    {
        writeln(strategyName, " executes differently");
    }
}

void main()
{
    FirstStrategy first = new FirstStrategy();
    SecondStrategy second = new SecondStrategy();

    first.execute();
    second.execute();
}
