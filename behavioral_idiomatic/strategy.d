#!/usr/bin/env rdmd
/+
dub.json:
{
    "name": "strategy"
}
+/

import std.stdio;

template isStrategy(T) {
    const isStrategy = __traits(hasMember, T, "execute");
}


struct FirstStrategy {
    static assert(isStrategy!FirstStrategy);

    void execute() {
        writeln("First strategy executes");
    }
}

struct SecondStrategy {
    static assert(isStrategy!SecondStrategy);

    void execute() {
        writeln("Second strategy executes differently");
    }
}

void main() {
    auto first = FirstStrategy();
    auto second = SecondStrategy();

    first.execute();
    second.execute();
}
