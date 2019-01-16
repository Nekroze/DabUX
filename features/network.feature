# vim: ts=4 sw=4 sts=4 noet
Feature: Subcommand: dab network
	The network subcommand provides management over the lab network.

	Background:
		As a mildly patient user.

		Given the aruba exit timeout is 60 seconds

	Scenario: Network is ensured to exist
		The network is ensured to exist in the background of each dab run.
		Sometimes dab does not run quick enough to allow this to complete so
		here I execute a slightly slower than normal command to allow CI enough
		time to create it.

		When I successfully run `dab apps list`

		Then I successfully run `docker network inspect lab`
