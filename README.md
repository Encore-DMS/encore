# Encore

Encore is a MATLAB based data management system for scientists. It provides a multi-user database for scientific data and a user interface to curate, query, and share data.

## Clone

`git clone https://github.com/Encore-DMS/encore-matlab.git --recursive`

**Note:** You must use the `--recursive` option to recursively clone all submodules.

## Build

Matlab functions in the root directory are used to build the project. The scripts are named according to the build phase they execute. The phases include:

- `test`: run tests using the Matlab unit test framework
- `package`: package the project into a .mltbx file
- `install`: install the packaged product into Matlab

Similar to the [Maven Build Lifecycle](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html), each phase will execute all phases before it (i.e. running `install` will execute `test`, `package`, `install`). In addition there is a `site` script to generate the project's documentation from the [wiki](https://github.com/Encore-DMS/encore-matlab/wiki).

## Directory Structure

The project directory structure generally follows the [Maven Standard Directory Layout](https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html).

## License

Licensed under the [MIT License](https://opensource.org/licenses/MIT), which is an [open source license](https://opensource.org/docs/osd).
