# vim: ts=4 sw=4 sts=4 noet
Feature: Subcommand: dab group
	The group subcommand manages groups of groups and repostory entrypoints.

	Background:
		Given the aruba exit timeout is 60 seconds

	Scenario: Can list defined groups
		Given I successfully run `dab repo add one https://github.com/Nekroze/dotfiles.git`
		And I successfully run `dab group repos mylist one deploy`

		When I run `dab group list`

		Then it should pass with:
		"""
		mylist
		"""
