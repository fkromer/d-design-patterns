# d-design-patterns

[![Build Status](https://travis-ci.org/fkromer/d-design-patterns.png)](https://travis-ci.org/fkromer/d-design-patterns)

A collection of D design patterns/idioms (inspired by
[python-patterns](https://github.com/faif/python-patterns))

## Usage

Install `dmd` compiler (includes `rdmd` as well) like described on the
[dlang.org download website](https://dlang.org/download.html) e.g. on Ubuntu:

    curl -fsS https://dlang.org/install.sh | bash -s dmd

Activate the D environment e.g. on Ubuntu:

    source ~/dlang/dmd-2.075.1/activate

Run the examples with `rdmd`:

    cd behavioral
    ./strategy.d

or

    rdmd strategy.d

(`dub` only) Install `dub` e.g. on Ubuntu:

    `sudo apt-get install dub`

Run the examples with `dub`:

    cd behavioral
    dub strategy.d
