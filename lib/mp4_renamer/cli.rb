module Mp4Renamer
  class CLI < Thor
    desc 'execute', 'Execute the main program'
    method_option "base_dir",
                  aliases: '-b',
                  desc:    'Starting directory',
                  default: File.expand_path(".")
    method_option 'recursive',
                  aliases: '-r',
                  desc:    'Perform the operation recursively',
                  default: true
    method_option :commit,
                  type:    :boolean,
                  aliases: "-c",
                  desc:    "Commit your changes",
                  default: false
    method_option 'version',
                  type:    :boolean,
                  aliases: '-v',
                  desc:    'Display version number',
                  default: false
    def execute
      opts = options.symbolize_keys
      if opts[:version]
        puts "You are using Mp4Renamer version #{Mp4Renamer::VERSION}"
        exit
      end
      process(opts)
    end

    desc 'usage', 'Display help screen'
    def usage
      puts <<-EOS
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
      EOS
    end

    default_task :usage

    private

    def process(opts = {})
      puts "FYI: your options #{opts.inspect}"
      # Note: currently `mp4info` gem supports only two extensions
      opts.merge!(exts: %w(mp4 m4a MP4 M4A))
      files = CodeLister.files(opts)

      if files.empty?
        puts "No files found for your options #{opts}"
        return
      end

      renamer = Renamer.new(opts[:commit])
      unless opts[:commit]
        puts '-----------------------------------------------------------------------'
        puts 'FYI: this is a dry-run only, to commit your changes use --commit option'
        puts '-----------------------------------------------------------------------'
      end
      files.each do |file|
        renamer.rename(file)
      end
    end
  end
end
