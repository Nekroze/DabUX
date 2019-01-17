# Dab UX

This repository stores clear feature tests for the [Dab][1] command line
interface's major functionality, forming a kind of contract that the [Dab] CLI
interface must continue to adhere to in the future to provide a better user
experience. Features are used both as regressions tests, usage documentation,
and a feed for events about the [Dab][1] CLI changing This test suite uses
Cucumber Aruba for cli testing.

# Writing Feature Files

Aruba provides a corpus of predefined steps that should provide just about
everything you could need to test any command line interface. For usage
information check out the [documentation][2] or [implementation][3].

[1]: https://github.com/Nekroze/dab
[2]: https://relishapp.com/cucumber/aruba/docs
[3]: https://github.com/cucumber/aruba/blob/master/lib/aruba/cucumber
