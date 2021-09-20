# Packaging Code Into a Project

- [Project Directory](#set-up-the-project-directory)
- [Gemfile Setup](#set-up-the-gemfile)
- [Adding More](#adding-more)
- [Rakefile Setup](#set-up-the-rakefile)
- [gemspec](#gemspec)

## Set up the Project Directory

**What is a project?** Any collection of files that is used to develop, test, build, or distribute software. Software can describe either an executable program, a library module, or some combination of the two. Projects can range in size from a few to many thousands of files.

In Ruby, projects follow certain standardized templates and patterns. It is expected that particular files will be present within the project, and project files and directories should be organized and formatted according to a commonly agreed upon standard.

The most common standard used is that of the RubyGems.

- `lib` directory contains all the Ruby code source files.
- `test` directory contains the code responsible for testing the project functionality.
- `assets` directory contains any images, content, javascript or stylesheets for the project. It may be separated into subdirectories pertaining to the above categories.
- If the project uses Bundler, it should include a `Gemfile` and a `Gemfile.lock`.
- If the project uses Rake, it should include a `Rakefile`.
- Note that spaces should be avoided in all directory names.

**Step One:** Create a remote repository on Github for the project. Then create a directory on your local file system. Link the local and remote repository according to standard Github commands.

**Step Two:** Organize the files within the project directory according to the correct standard (see above for RubyGems standard).

**Step Three**: Use `require_relative` to link any dependent files together. Note that `require_relative` loads files _relative_ to the location of the original files, so ensure that the correct path/location are provided.

## Set up the Gemfile

A `Gemfile` usually requires four pieces of information:

- Where should Bundler look for the RubyGems it needs to install?

  ```ruby
  source 'https://rubygems.org'
  ```

- Include a `gemspec` statement if a `.gemspec` file is included in your project.

- What version of Ruby does the program need?

  ```ruby
  ruby '3.0.0'
  ```

- What RubyGems does the program use? What are their versions?
  - Look to all the `require` statements in the source code to determine what Gems are used.
  - You can also search through Gem directories to determine which version of a Gem the program loads (use the `find` command)
  - List _each_ Gem the program uses with it's own `gem` statement

  ```ruby
  gem 'minitest', '~> 5.14.4'
  gem 'minitest-reporters', '~> 1.4.5'
  ```

  - If you add more gems to the project later, remember to run `bundle install` again to generate a new `Gemfile.lock`.

**Step One:** Create the Gemfile with the name `Gemfile`. Fill in all the relevant information (see above).

**Step Two:** Run the correct version of Ruby in your CLI environment, use `rvm use <ruby-version-number>`.

**Step Three:** Use `bundle install` to have Bundler find and install all the project dependencies, as well as generate a `Gemfile.lock`. Run this again if any changes are made to the `Gemfile`.

**Step Four:** Add `require 'bundler/setup'` to the _top_ of _all_ main program files.

**Step Five:** Run tests to ensure everything is working properly.

## Adding More

If you add more gems and/or functionality to the program, you will have to repackage it so your updates are reflected as part of the distributed project product.

**Step One:** Add any additional features or functionality. `require` any additional Gems you may utilize.

**Step Two:** Add additional tests or assertions to check your new features. You may also need to `require` additional gems here.

**Step Three:** Add a new `gem` statement to the `Gemfile` for any additional gems that may now be included in the project. Run `bundle install` again to create a new and updated `Gemfile.lock`.

**Step Four:** Run the tests again to ensure there has been no regression from the new features.

## Set up the Rakefile

**Step One:** Create a `Rakefile` in the project's top level directory. Use the Rake DSL to write up some automated tasks.

**Step Two:** Add Rake to the `Gemfile` with its own `gem` statement. Re-run `bundle install` to update the `Gemfile.lock`.

**Step Three:** Check to make sure everything is working by running `bundle exec rake -T` to list tasks available to Rake.

**Step Four:** Run the task you want to automate with `bundle exec rake <task-name>`

Note that you can `require` standardized tasks into the Rakefile, such as with `require 'rale/testtask'`.

## gemspec

If your project is a Ruby Gem it will need a `.gemspec` file. This includes all the information relevant to the project such as the developer name and contact information, version number, and description.

```ruby
Gem::Specification.new do |s|
  s.name        = 'my_project'
  s.version     = '1.0.0'
  s.summary     = 'Super Cool Gem!'
  s.description = 'This does super cool gem stuff!'
  s.authors     = ['Ginni Pinckert']
  s.email       = 'gp@example.com'
  s.homepage    = 'http://example.com/my_project'
  s.files       = ['lib/my_project.rb', 'test/my_project_test.rb']
end
```

This also means you need to add a `gemspec` statement to the `Gemfile`, and modify the `Rakefile` to include the standard RubyGem tasks. This is done by adding `require 'bundler/gem_tasks'` to the top of the `Rakefile`.
