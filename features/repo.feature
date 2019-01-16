# vim: ts=4 sw=4 sts=4 noet
Feature: Subcommand: dab repo
	The repo subcommand manages configured git repositories.

	Background:
		Given the aruba exit timeout is 60 seconds

	@smoke
	Scenario: Can use custom arguments in entrypoints
		Given I successfully run `dab repo add dotfiles7 https://github.com/Nekroze/dotfiles.git`
		And I run `dab repo entrypoint create dotfiles7 start`
		And I successfully run `dab config add repo/dotfiles7/entrypoint/start echo '\"$1\"'`

		When I run `dab repo entrypoint run dotfiles7 start FOO`

		Then it should pass with "FOO"
