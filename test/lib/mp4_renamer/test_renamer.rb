require_relative '../../test_helper'
describe Mp4Renamer do
  let :renamer do
    Renamer.new
  end

  let :helper do
    FixtureHelper.new
  end

  before do
    helper.setup
  end

  after do
    helper.teardown
    # remove the file that we rename also if after the steps
  end

  describe '#rename' do
    it 'renames the file if metadata is valailable' do
      helper.sample_files.each do |file|
        result = renamer.rename(file)
        # the result must be available
        assert(result)
        # cleanup after each use
        FileUtils.rm_rf result
      end
    end
  end
end
