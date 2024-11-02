# Asciidoctor::Boost

This package provides macros for use in creating Boost documentation using Asciidoctor.

## Installation

Install it with:

    $ gem install asciidoctor-boost --user-install

## Usage

After installing the gem, you can use the macros in asciidoctor with

    $ asciidoctor -r asciidoctor_boost -o output.html input.adoc

### Macros

#### `boost_at`

* **Provided .adoc macro:** `boost_at:/libs/function[Function]`
* **.html output:** `<a href="/libs/function">Function</a>`
* **Previous .qbk (for reference):** `[@/libs/function/ Function]`

#### `boost_github`

##### Issue

* **Provided .adoc macro:** `boost_gh:issue[geometry, 1231]`
* **.html output:** `<a href="https://github.com/boostorg/geometry/issues/1231">#1231</a>`
* **Previous .qbk (for reference):** `[github geometry 1231]`

##### PR

* **Provided .adoc macro:** `boost_gh:pr[charconv, 321]`
* **.html output:** `<a href="https://github.com/boostorg/charconv/pull/321">PR#321</a>`
* **Previous .qbk (for reference):** `[github_pr charconv 321]`

#### `boost_phrase`

##### Text

* **Provided .adoc macro:** `boost_phrase:library[Hi!]`
* **.html output:** `<span class="library">Hi!</span>`
* **Previous .qbk (for reference):** `[phrase library..XX]`

##### Text with link

* **Provided .adoc macro:** `boost_phrase:library[Charconv:,/libs/charconv/]`
* **.html output:** `<span class="library"><a href="/libs/charconv/">Charconv:</a></span>`
* **Previous .qbk (for reference):** `[phrase library..[@/libs/charconv/ Charconv]:]`

## Development

After checking out the repo, run `bin/setup` to install dependencies.

Run `pre-commit install`.

### Testing
After making your changes to test you can run:
* `make test_doc` - tests the macros on `tests/test_data/basic.adoc` using the modified code
* `make test_doc_gem` - builds and installs the gem locally, runs the same test with the gem]

### Creating a release

1. Update the version number in `version.rb`
1. Run `bundle update`
1. commit the changed files.
1. Push to a branch, create a PR against main.

### Cleanup
`make clean` will remove the locally installed gem and the generated files from tests.

`make clean` is called by `make test_doc` and `make test_doc_gem` running.


### Development Notes:

On some OSes/distros the `bundle` binary may be called `bundle3.0` - it may be helpful to symlink it with `sudo ln -s /bin/bundle3.0 /bin/bundle`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cppalliance/asciidoctor-boost.
