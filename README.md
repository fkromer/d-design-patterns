d-design-patterns [![Build Status](https://travis-ci.org/fkromer/d-design-patterns.png)](https://travis-ci.org/fkromer/d-design-patterns)
=================

A collection of D design patterns/idioms (inspired by
[python-patterns](https://github.com/faif/python-patterns))

## Usage

Working D compiler is required, check out [download](https://dlang.org/download.html) page on dlang.org.

You can run examples with `rdmd` tool, [dub](http://code.dlang.org/download) or build them manually.

### Run with `rdmd`

```
$ rdmd example.d
```

### Run with `dub`

dub is a build tool and package manager for the D programming language. Every example in this repository is a single-file dub package.

```
$ dub example.d
```

### Build manually

Use one of:

```
$ dmd example.d # for DMD compiler
$ gdc example.d # for GDC
$ ldc2 example.d # for LDC
```

This will compile and link `example` program:

```
$ ./example
```

## List of patterns:

### Behavioral patterns

| Pattern | Description |
|---------|-------------|
| [Strategy](behavioral/strategy.d) | selectable operations over the same data |

### Behavioral patterns (Idiomatic)

| Pattern | Description |
|---------|-------------|
| [Strategy](behavioral_idiomatic/strategy.d) | selectable operations over the same data |

### Structural patterns

| Pattern | Description |
|---------|-------------|
| [Decorator](structural/decorator.d) | wrap functionality with other functionality in order to affect outputs |
| [Facade](structural/facade.d) | use one class as an API to a number of others |
