require 'fileutils'
module Mp4Renamer
  class FixtureHelper
    attr_reader :fixture_files,
                :fixtures_dir,
                :sample_files

    def initialize
      @fixtures_dir  = File.expand_path("../../../../fixtures", __FILE__)
      @fixture_files = %w(01.mp4 02.m4a).map { |file| [fixtures_dir, file].join(File::SEPARATOR) }
      @sample_files  = fixture_files.map { |file| sample_file(file) }
    end

    def setup
      fixture_files.each do |file|
        FileUtils.cp file, sample_file(file)
      end
    end

    def teardown
      fixture_files.each do |file|
        FileUtils.rm_rf sample_file(file)
      end
    end

    private

    def sample_file(file)
      [fixtures_dir, "sample_#{File.basename(file, '.*')}#{File.extname(file)}"].join(File::SEPARATOR)
    end
  end
end
