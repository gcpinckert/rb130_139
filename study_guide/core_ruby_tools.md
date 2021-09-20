# Core Ruby Tools

- [Overview](#overview)
- [Installing Ruby](#installing-ruby)
- [Ruby Version Managers](#ruby-version-managers)
- [Gems](#gems)
  - [What are Gems?](#what-are-gems?)
  - [Working with Gems](#working-with-gems)
- [Bundler](#bundler)
  - [Gemfile and Gemfile.lock](#gemfile-and-gemfile.lock)
  - [Using Bundler](#using-bundler)
  - [bundle exec](#bundle-exec)
- [Rake](#rake)

## Overview

- [RubyGems](https://rubygems.org/) provides a library of code packages called **gems**. These can be downloaded and either run directly within Ruby programs (with `require`), or from the command line. Use the `gem` command from the CLI to manage, install, and otherwise manipulate these code packages.
  - RubyGems also provides us with a standardized template, format, and structure for releasing our own gems. In face, all Ruby projects are packaged using the RubyGems format.
- [Ruby Version Managers](#ruby-version-managers) are pieces of software that help us deal with the fact that we may have multiple versions of Ruby installed on our local system. We want to make sure that our project Ruby (often standardized when multiple developers are working on the same project) is the right version, as well as matching the Ruby that we may be running in our environnement. Ruby Version managers such as RVM and Rbenv can help us deal with the complications that can arise from this.
- **Bundler** is a gem that manages **dependencies** in a Ruby project. Within the project, the developer includes a `Gemfile` that contains all the information regarding which Ruby version, the gems the project relies on, and what version of those gems the project needs. Then, when distributing the program to other systems, Bundler installs all the necessary components listed, as well as making sure to utilize the correct version of Ruby and Gems.
- **Rake** is a gem that allows us to automate repetitive tasks, having to do with building, testing, packaging, and installing a project. We define these tasks in a `Rakefile` which uses a DSL (Domain Specific Language) to define "tasks" (which are really just small Ruby programs) that can be executed from the Command Line with `rake`.
- `.gemspec` is a special file included in all Gem projects. It provides information such as name, summary, authors, contact info etc about a released Gem. If you want to release a program or library as Gem you _must_ include a `.gemspec` file.

## Installing Ruby

_Note: The following installation notes are specific to Linux._

Use a [Ruby Version Manager](#ruby-version-managers) (such as _RVM_ or _rbenv_) to install Ruby onto your local machine. This is preferable to using a system version of Ruby, which are often outdated and can sometimes require root access.

Use the command `which ruby` to see where your system finds the `ruby` command. If `/usr/bin/ruby` is output, you are using the system version of Ruby.

Use the command `ruby -v` to find out what version of Ruby is currently running.

Each Ruby installation comes with some of the necessary files and tools:

- `ruby` command = runs Ruby programs
- The core library = built-in objects, classes, and methods)
- The standard library = object, classes, and methods you can `require`)
- The `irb` REPL = test small snippets of code
- `rake` utility = runs automated tasks you have specified in the `Rakefile` of a project
- `gem` command =  a tool to manage RubyGems
- `rdoc` and `ri` = documentation tools

## Ruby Version Managers

**Ruby Version Managers** = programs that help us install, manage, and organize multiple versions of Ruby on the same local system. This includes any of the utilities included with a particular Ruby version, as well as any Gems installed with a particular Ruby version.

_Why do we need Ruby Version managers?_

- Ruby is an ever changing language, and some versions of Ruby have features that others do not. Different programs may take advantage of some of these non-universal features, necessitating a different version of Ruby for some programs.
- Projects that are being worked on by multiple developers often standardize what version of Ruby should be used, so that different parts of the project do not become incompatible.
- Working on multiple projects that utilize different versions of Ruby (for whatever reason) may necessitate switching between Ruby versions.

Version managers allow us to quickly and easily install and uninstall Ruby versions, as well as run whichever specific version of Ruby is required within a specific environment. They automate the sometimes laborious process of switching between versions, allowing us to juggle multiple Rubies on a single system without getting our files hopelessly tangled.

There are two major options for Ruby Version Managers:

- RVM = includes more features, and works by _dynamically_ managing your development environment (command line). [RVM Cheat Sheet](./rvm.md)
- rbenv = does not initially include as many features, but allows you to install "plugins" that give more functionality. Works mostly by modifying your environment variables (such as `$PATH`).

## Gems

### What are Gems?

**Gems** = code packages that can be downloaded and installed. They either work directly within Ruby programs (such as with `require pry`), or can be run directly from the command line (such as with `rake`, `bundle`, `rubocop`, etc).

Gems are managed with the `gem` command. Install a new gem with `gem install <gem-name>`. Search the [RubyGems](https://rubygems.org/) website for a gem you may with to install.

### Working with Gems

When `gem` installs a new Gem, it puts all the files that make up the Gem in the **local gem library**. This location is determined by what Ruby version you are using and whether you are utilizing a Ruby Version Manager like RVM or rbenv. Find this local gem library to look at gem source code or diagnose a problem with a gem.

`gem env` = prints a list of information about your RubyGems installation

- `RUBY VERSION` = shows the version number of the Ruby associated with the `gem` command (recall that each Ruby has it's own version of `gem`)
- `RUBY EXECUTABLE` = location of the `ruby` command you should use with this particular `gem` command.
- `INSTALLATION DIRECTORY` = where `gem` installs Gems
- `USER INSTALLATION DIRECTORY` = if `gem` installs gems in your home directory instead of on a system level
- `EXECUTABLE INSTALLATION DIRECTORY` = Where `gem` stores commands that can be used directly from the CLI. Should be included in the shell `PATH` variable (this is usually handled by RVM)
- `REMOTE SOURCES` = Remove lib used by the `gem` installation
- `SHELL PATH` = value of the shell `PATH` variable

Gems, like Ruby, also have specific versions. Different programs may rely on different versions and running the wrong version of a Gem with a given program may cause issues.

The full path name of the gem your program loaded can provide information about the specific Gem version. Use `puts $LOADED_FEATURES.grep(/<name_of_gem>\.rb/)` somewhere in the program after `require` to output the full pathname for the Gem in question.

Bundler is a gem that helps us manage programs that rely on features from different versions of Gems.

## Bundler

**Bundler** = a gem that works as a _dependency manager_. That is, it helps simplify the installation and environnement usage of different multiple versions of Ruby and Gems for any given project.

It's capabilities include:

- specification of which Ruby and which Gems you want to use with a Ruby program
- installation of multiple versions of each gem under a specific version of Ruby

Bundler does not come with Ruby. It needs to be installed with the command `gem install bundler`. Note that it needs to be installed for _each_ version of Ruby that you use.

### Gemfile and Gemfile.lock

To use Bundler, we include a `Gemfile` in our project directory. This utilizes a specific Bundler DSL to list the Ruby and Gem versions that a particular project uses. It functions as a configuration file for Bundler. It contains the following information:

- `source` = the remote library where any gems to be installed can be found (most usually, `https://rubygems.org`).
- `ruby` = tells what Ruby version you want the program to use
- `gem` = tells the gem name and the version you want the project to use
- Note that each individual gem the project utilizes needs it's own `gem` statement.
- `gemspec` = statement that tells the `Gemfile` if there is a `gemspec` file

```ruby
source 'https://rubygems.org'

ruby '2.3.1'
gem 'sinatra'
gem 'erubis'
gem 'rack'
gem 'rake', '~>10.4.0'
```

Once we have the `Gemfile`, we run `bundle install` on the command line to create a `Gemfile.lock`. This will include information on _all_ the dependencies within a project, including any other Gems that the Gems listed in the `Gemfile` will need to function.

If there are **any** changes made to the `Gemfile`, the `bundle install` command must be run again so that a new and updated `Gemfile.lock` is created. Otherwise, Bundler will not function properly, and will not install all the necessary dependencies.

### Using Bundler

To utilize Bundler, add the statement `require 'bundler/setup'` to the beginning of your code file(s). Note that this must be added _before any other required gems_ (otherwise these gems will not be added with Bundler). This statement ensures that your program uses what is listed in the `Gemfile.lock` instead of defaulting to the most recent version when loading Gems used by the program.

Note that Bundler does not change at all how Rubies and Gems are stored. This is determined by the Ruby Version Manager.

### bundle exec

Use the `bundle exec` command directly from the command line when you can't add the `require 'bundler/setup'` statement directly to the code file (such as with the `Rakefile`), or when there are dependency conflicts within the project itself, or between the CLI environment and the project.

`bundle exec` ensures that the command you run will execute in an environment that includes the versions outlined in the `Gemfile.lock`. Typically this is used for gems that run directly from the command line, which may have different versions of ruby and it's gems than those outlined in the program by the `Gemfile.lock`. These can include `rake`, `pry`, etc. Because the shell cannot access the `Gemfile.lock`, we use `bundle exec` to ensure the environment uses to correct version information.

If you see an error message like:

```plain text
Gem::LoadError: You have already activated rake 11.3.0, but your Gemfile requires rake 10.4.2. Prepending `bundle exec` to your command may solve this.
```

You can fix it by running `bundle exec` with the command in question.

## Rake

**Rake** = A Ruby gem that automates common and repetitive actions, such as tasks pertaining to building, testing, packaging and installing programs. Specifically, these can include setting up an environment (building directories and files), running tests, common Git tasks, packaging for distribution, as well as any number of other things.

Rake comes included with all modern Ruby installations, and does not need to be installed.

Define which tasks you want to automate for a particular project by adding a `Rakefile` to the project directory. This file will include the name, description, and actual code behind any of the tasks you want to automate. It is written in plain Ruby with some specific DSL method calls that pertain to rake:

- `desc` = gives a short description of the task
- `task` = associates a task name with a block of code (or list of dependencies)

```ruby
desc 'Task description'
task :name do
  # ruby code that implements the task goes here
end
```

Each of the tasks described in the `Rakefile` can be executed from the CLI using the `rake` command + the name of the task in the rakefile (i.e. `rake name`). You can also define a **default** task within the `Rakefile`, which will run if no specific task name is provided to the `rake` command.

```ruby
desc 'description here'
task :default => [ :task_1, :task_2 ]
```

Run the command `rake -T` from the CLI to list all the commands Rake can run along with their associated descriptions.

If your program uses Bundler, you should run the command `bundle exec` with `rake` to ensure that your CLI environment corresponds to the dependencies of your project.
