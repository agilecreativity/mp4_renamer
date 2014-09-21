## Mp4Renamer

[![Gem Version](https://badge.fury.io/rb/mp4_renamer.svg)][gem]
[![Dependency Status](https://gemnasium.com/agilecreativity/mp4_renamer.png)][gemnasium]
[![Code Climate](https://codeclimate.com/github/agilecreativity/mp4_renamer.png)][codeclimate]

[gem]: http://badge.fury.io/rb/mp4_renamer
[gemnasium]: https://gemnasium.com/agilecreativity/mp4_renamer
[codeclimate]: https://codeclimate.com/github/agilecreativity/mp4_renamer

Simple gem to rename the `mp4` or `m4a` file by adding the running time to the input file name.

e.g. If the input file name is `introduction.mp4` and it contain `00:54` of running time then
the file would be renamed to `introduction_00_54.mp4` e.g. <original_filename><running_time>.mp4

- Support the `*.m4a` and `*.mp4` file formats only

### Sample Usage

- Install the gem

```shell
$gem install mp4_renamer
```

- Running the command without any argument will show the default help message

```shell
mp4_renamer
```

Should show the following output

```
Usage:
  mp4_renamer [options]

Options:
  -b, [--base-dir=BASE_DIR]        # Starting directory
                                   # Default: . (current directory)
  -r, [--recursive=RECURSIVE]      # Perform the operation recursively
                                   # Default: true
  -c, [--commit], [--no-commit]    # Commit your changes
                                   # Default: --no-commit
  -v, [--version], [--no-version]  # Display version number
                                   # Default: --no-version

Execute the main program
```

- Running the default command to see what will the result be like without making any changes (dry-run)

```shell
mp4_renamer --base-dir . --recursive

# or short version
mp4_renamer -b . -r
```

Shous show outputs similar to the following

```
FYI: your options {:base_dir=>".", :recursive=>true, :commit=>false, :version=>false}
-----------------------------------------------------------------------
FYI: this is a dry-run only, to commit your changes use --commit option
-----------------------------------------------------------------------
FYI: input file : ./fixtures/01.mp4
FYI: output file: ./fixtures/01_00_54.mp4
FYI: input file : ./fixtures/02.mp4
FYI: output file: ./fixtures/02_00_54.mp4
```

- To make your change permanent just add the `--commit` flag

```shell
mp4_renamer --base-dir . --recursive --commit
# or short version
mp4_renamer -b . -r -c
```

### Why is this useful?

- Know how long it will take to watch the video
- Give you the context without the need to open file and look at the running time of a given file
- To make your output even more useful, try using this with [filename_cleaner][] gem

### Installation

Add this line to your application's Gemfile:

    gem 'mp4_renamer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mp4_renamer

### Usage

Use as library try

```ruby
require 'mp4_renamer'
include Mp4Renamer
# then call the appropriate functions
```

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[Thor]: https://github.com/erikhuda/thor
[Minitest]: https://github.com/seattlerb/minitest
[RSpec]: https://github.com/rspec
[Guard]: https://github.com/guard/guard
[Yard]: https://github.com/lsegal/yard
[Pry]: https://github.com/pry/pry
[Rubocop]: https://github.com/bbatsov/rubocop
[Grit]: https://github.com/mojombo/grit
[filenamer_cleaner]: https://github.com/agilecreativity/filename_cleaner
