module Mp4Renamer
  module Errors
    InvalidInputFileError = Class.new(StandardError)
    MetadataNotAvailableError = Class.new(StandardError)
  end

  class Renamer
    attr_reader :commit

    # Initialization code
    #
    # @param [Boolean] commit the flag to indicate if the operation is to be executed
    def initialize(commit = false)
      @commit = commit
    end

    # Rename the input mp4 file and append the track time to the end
    #
    # @param [String] filename the input file
    # @param [String] sep_string the separator string to use default to '_' underscore
    # @raise [Errors::InvalidInputFileError] if the file is not valid or not readable
    # @example
    #   # if the running time for the `sample.mp4` is '06:10' minutes
    #   rename("/path/to/sample.mp4")         #=> will rename the file to '/path/to/sample_06.10.mp4'
    #   rename("/path/to/bad-input-file.mp4") #=> will raise error
    def rename(filename, sep_string = '_')
      raise Errors::InvalidInputFileError unless File.exist?(filename) && File.readable?(filename)
      puts "FYI: input file : #{filename}"
      info = MP4Info.open(filename)

      # e.g. Other useful information that may be used if applicable
      # * SECS - Total seconds, rounded to nearest second
      # * MM   - Minutes
      # * SS   - Leftover seconds
      # * MS   - Leftover milliseconds, rounded to nearest millisecond
      # * TIME - Time in MM:SS, rounded to nearest second
      # Note: info.TIME always available? if not we need to ignore the operation
      # Or just skip the file?
      raise Errors::MetadataNotAvailableError unless info.TIME

      running_time = info.TIME.gsub(":", sep_string)

      base_name = File.basename(filename, '.*') # 'sample01'
      ext_name  = File.extname(filename)        # '.mp4'
      dir_name  = File.dirname(filename)        # '/path/to/this/sample'

      new_name = "#{base_name}#{sep_string}#{running_time}#{ext_name}"
      output_file = [ dir_name, new_name ].join(File::SEPARATOR)
      # now let rename the file
      FileUtils.mv filename, output_file if commit

      puts "FYI: output file: #{output_file}"
      output_file
    end
  end
end
