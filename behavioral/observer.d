#!/usr/bin/env rdmd
/+
dub.json:
{
    "name": "observer"
}
+/

import std.stdio;

class Observable
{
protected:
    Observer[Observer] observers;
    this()
    {
        this.observers = null;
    }
public:
    void register(Observer observer)
    {
        this.observers ~= observer;
    }
    void unregister(Observer observer)
    {
        this.observers.remove(observer);
    }
    void notifyObservers()
    {
        foreach (observer; this.observers)
        {
            observer.update(this);
        }
    }
}

class Observer
{
    this(Observable observable)
    {
        observable.register(this);
    }
}

class Data : Observable
{
protected:
    int value_;
public:
    int value() const @property
    {
        return this.value_;
    }
    void value(int value) @property
    {
        this.value_ = value;
    }
}

class HexViewer : Observer
{
public:
    this() {};
    void update(Observable observable)
    {
        writefln("HexViewer was notified and updated to %x", observable.value);
    }
}

void main()
{
    Observable subject = new Data();
    Observer hexview = new HexViewer(subject);
    subject.notifyObservers();
}
