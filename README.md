# Dab UX

This repository stores clear feature tests for the [Dab][1] command line
interface's major functionality, forming a kind of contract that the [Dab][1] CLI
interface must continue to adhere to in the future to provide a better user
experience. Features are used both as regressions tests, usage documentation,
and a feed for events about the [Dab][1] CLI changing This test suite uses
[Cucumber][4] [Aruba][5] for CLI testing.

# Writing Feature Files

Aruba provides a corpus of predefined steps that should provide just about
everything you could need to test any command line interface. For usage
information check out the [documentation][2] or sometimes more useful is the
[implementation][3].

# Testing

Features are tested against the latest version of Dab or a local version if one
is specified or found in an expected location. Before merging changes tests are
executed in CI to public assert the tests are all passing.

```bash
./test.sh
```

# Generating The Website

Feature files can be converted into a simple static HTML website able to be hosted on GitHub pages and the like. Any changes to feature files require a manual execution of the following script to update the website's static resources, CI will _not_ run this for you!

```bash
./ssg.sh
```

At the end it should give you a link able to be opened in your browser to view the generated website.

[1]: https://github.com/Nekroze/dab
[2]: https://relishapp.com/cucumber/aruba/docs
[3]: https://github.com/cucumber/aruba/blob/master/lib/aruba/cucumber
[4]: https://cucumber.io/
[5]: https://github.com/cucumber/aruba
