
# iaria – Write documents for the IARIA publications

This repository hosts the source code for the [CTAN](https://ctan.org/) package [IARIA](https://ctan.org/pkg/iaria).


This package contains templates for the creation of documents for IARIA publications (International Academy, Research, and Industry Association) and implements the specifications for the IARIA citation style.


DISCLAIMER: This class is neither for XeLaTeX or LuaTeX nor for legacy bibtex or natbib.
For these have a look at [CTAN](https://ctan.org/) package [IARIA-lite](https://ctan.org/pkg/iaria-lite).

If you just want to extend your LaTeX installation please download the [IARIA package from CTAN](https://ctan.org/pkg/iaria) and follow the installation instructions.

If you want to extend the package please follow this guideline.

## Building the package

To build the package from source clone this repository:

```bash
$ git clone https://github.com/cyberlytics/iaria.git
```

and run `make`:

```bash
$ make dist
```

This will create the zip file `dist/iaria.zip` with the complete installation package as it can be downloaded from CTAN.

All build artifacts without the archive itself can be build with:

```bash
$ make compile
```

The repository can be cleaned up with:

```bash
$ make clean
```

## The source files

* `dependencies/` contains third party tools that are needed for compilation
* `doc/iaria.tex` The user documentation of the IARIA class
* `patch/` Files needed for patching generated artifacts
* `src/iaria.cls` The LaTeX class of the package
* `static` All files that will be added unchanged to the CTAN package like `README` and template sources

## Build artifacts

All build artifacts can be found in `build`. The `Makefile` builds the following artifacts:

* `iaria.ins` and `iaria.dtx` which contains the LaTeX installation package and the documentation source.
* `iaria.pdf` the documentation of the class
* `*-example-*.zip` include TEX+PDF example based on this class

## Build dependencies

The build environment needs the following Unix tools to be installed:

* GNU make
* LaTeX (inclduding `latexmk`)
* perl
* Unix commandline: bash, echo, cp, mv, rm, ed, cut, mkdir, head

## Contact

* [Christoph P. Neumann <cyberpetaneuron@gmail.com>](mailto:cyberpetaneuron+iaria@gmail.com)