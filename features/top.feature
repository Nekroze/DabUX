# vim: ts=4 sw=4 sts=4 noet
Feature: A Lab Of Your Own
	Dab provides tools to setup and even share a reproducable local development
	environment.
	
	You can have Dab manage your git repositories and store common
	procedures as "entrypoints" that  execute within the reproducable Dab
	image. These entrypoints have access to a large corpus of Dockerized
	applications and services Dab provides and can be combined into groups to
	execute in sequence. This allows for complex development labs that behave
	the same across heterogenous host machines and even operating systems.

	Scenario: Every command and subcommand provides usage/help information
		You can give the usual help switches like `-h` and `--help` however
		these are the only switches in the whole Dab cli, instead dab uses
		explicit subcommands so `help` also works. It makes for less variations
		to memorize and easier usage when combined with shell completion.
		
		If given to a "subcommand namespace" (a command that does nothing but
		have other commands under it) such as `dab` you will be given a list of
		subcommands, their aliases, and a short description of what they do.

		When I run `dab help`

		Then the output should contain "Usage:"
		And the output should contain "SUBCOMMAND"
		And the output should contain "ALIASES"
		And the output should contain "DESCRIPTION"
	
	Scenario Outline: Everything is executed within the ephemeral docker container
		In order to ensure a reproducable environment across all kinds of host
		machines (eg, Linux and OSX) everything gets executed within an
		ephemeral docker container, the Dab image.

		Within this image is the application code for Dab itself plus various
		tools useful for orchestrating projects and procedures.

		You can explore what is available in this image by entering into an
		interactive shell running within or give it one off commands to run.

		When I run `dab shell which <COMMAND>`

		Then the exit status should be 0

		Examples:
			| COMMAND        |
			| docker         |
			| docker-compose |
			| entr           |
			| jq             |
			| multitail      |
			| yq             |
