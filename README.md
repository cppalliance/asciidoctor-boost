# Asciidoctor::Boost

This package provides macros for use in creating Boost documentation using Asciidoctor.

## Installation

Install it with:

    $ gem install asciidoctor-boost --user-install

## Usage

After installing the gem, you can use the macros in asciidoctor with

    $ asciidoctor -r asciidoctor_boost -o output.html input.adoc

## Development

After checking out the repo, run `bin/setup` to install dependencies.

Run `pre-commit install`.

## Creaing a release

1. Update the version number in `version.rb`
1. Run `bundle update`
1. commit the changed files.
1. Push to a branch, create a PR against main.


### Testing[
After making your changes to test you can run:
* `make test_doc` - tests the macros on `tests/test_data/basic.adoc` using the modified code
* `make test_doc_gem` - builds and installs the gem locally, runs the same test with the gem]

### Cleanup
`make clean` will remove the locally installed gem and the generated files from tests.

`make clean` is called by `make test_doc` and `make test_doc_gem` running.


### Notes:

On some OSes/distros the `bundle` binary may be called `bundle3.0` - it may be helpful to symlink it with `sudo ln -s /bin/bundle3.0 /bin/bundle`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cppalliance/asciidoctor-boost.
