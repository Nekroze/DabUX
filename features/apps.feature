# vim: ts=4 sw=4 sts=4 noet
Feature: Subcommand: apps
	Provides easy access to common/powerful apps.

	Background:
		Containers can be fast... but not over
		Australian internet.

		Given the aruba exit timeout is 300 seconds

	Scenario: Can list all available apps
		When I run `dab apps list`

		Then it should pass with "NAME"
		And the output should contain "DESCRIPTION"
