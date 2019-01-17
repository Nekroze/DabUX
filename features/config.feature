# vim: ts=4 sw=4 sts=4 noet
Feature: Subcommand: config
	The config subcommand manages the dab configuration key value store. Config
	keys are any word or sequence of words (for namespacing) delimited by a
	forward slash, eg. `foo/bar` would store the url for the dab repository.

	Scenario Outline: Can set and retrieve config values
		Config values can be altered and retrieved with set and get respectively.

		Given I successfully run `dab config set <KEY> <VALUE>`
		And it should pass with:
		"""
		setting config key <KEY> to <VALUE>
		"""

		Then I run `dab config get <KEY>`
		And it should pass with:
		"""
		<VALUE>
		"""
		And the file "~/.config/dab/<KEY>" should contain exactly:
		"""
		<VALUE>
		"""

		Examples:
			| KEY     | VALUE    |
			| foo     | bar      |
			| foo     | barry    |
			| bar.foo | 42       |
			| bar.foo | 42 barry |
