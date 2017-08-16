#!/usr/bin/env rdmd

import std.stdio : writefln;

interface Coffee
{
    float cost();
    string ingredients();
}

class SimpleCoffee : Coffee
{
    float cost()
    {
        return 1.0;
    }

    string ingredients()
    {
        return "Coffee";
    }
}

abstract class CoffeeDecorator : Coffee
{
    private Coffee decorated_coffee;

    this(Coffee d)
    {
        decorated_coffee = d;
    }

    float cost()
    {
        return decorated_coffee.cost;
    }

    string ingredients()
    {
        return decorated_coffee.ingredients;
    }
}

class WithMilk : CoffeeDecorator
{
    this(Coffee d)
    {
        super(d);
    }

    override float cost()
    {
        return super.cost + 0.5;
    }

    override string ingredients()
    {
        return super.ingredients ~ ", Milk";
    }
}

class WithSprinkles : CoffeeDecorator
{
    this(Coffee d)
    {
        super(d);
    }

    override float cost()
    {
        return super.cost + 0.2;
    }

    override string ingredients()
    {
        return super.ingredients ~ ", Sprinkles";
    }
}

void print(Coffee coffee)
{
    writefln("Cost: %1.1f; Ingredients: %s", coffee.cost, coffee.ingredients);
}

void main()
{
    Coffee coffee = new SimpleCoffee;
    print(coffee);

    coffee = new WithMilk(coffee);
    print(coffee);

    coffee = new WithSprinkles(coffee);
    print(coffee);
}
