# RVM

## Basic Structure

RVM is based on a set of directories on your local system that stores all the installed Ruby versions along with each version's tools (both included tools like `gem` and `irb` and any additional gems you have installed with a specific version of Ruby).

Give two subdirectories:

- `rubies` = stores all standard Ruby executables (`ruby`, `gem`, and `irb`)
- `gems` = stores any additional gems you have installed for a specific version of ruby (`bundler`, `rubocop`, `pry`, etc)

## Commands

| Command | What it does |
|---------| ------------ |
| `rvm` | A shell function that modifies the shell environnement such that the ruby and various gem commands invoke the correct version of Ruby and each specific gem. In a nutshell, changes the value assigned to `$PATH` environment variable so that `ruby` uses a Ruby version installed in a different directory |
| `rvm list rubies` | Shows which versions of Ruby you have installed, and displays which version is current and default |
| `rvm install <version-number>` | Installs a particular version of Ruby |
| `rvm use <version-number>` | Tells RVM to use a particular version of Ruby |
| `rvm use <version-number> --default` | Sets a default version of Ruby to run when no specific version is specified. Note: This can be done on a directory by directory basis (so that you can set different default versions for different projects). |
| `rvm use default` | Resets the default version of Ruby if a different version is currently being used |
| `rvm info rvm` | Displays information about RVM, including the path where all Rubies and Gems it manages are stored |

## Troubleshooting

Directory names or ancestors should not include any spaces

| Command | What it does |
| ------- | ------------ |
| `type cd | head -1 ; type rvm | head -1` | Verifies that you are using the `cd` and `rvm` functions, not the built in `cd` shell command. Should output: `cd is a function` and `rvm is a function`. |
| `echo $PATH` | shows the value referenced by the `PATH` variable. It should contain the `{RVM PATH}/rubies-{VERSION}/bin` and `{RVM PATH}/gem/rubies-{VERSION}/bin` |
| `rvm info` | displays information about the current RVM environment.
| `rvm current` | displays the active version of Ruby |
| `rvm fix-permissions` | Repairs the permissions of RVM files. Run this if you see "permission denied" messages on any of your Ruby or Gem files |
| `rvm repair all` | repairs files that help RVM manage the different rubies |
| `rvm get latest` | Downloads and installs the latest version of RVM. Most useful when you are using a new or unfamiliar feature that may not be available or working correctly in your current version |
| `gem env` | Displays configuration information about your RubyGems system |
| `gem list` | Displays a list of all gems installed with the _current version_ of Ruby (along with their version numbers) |
