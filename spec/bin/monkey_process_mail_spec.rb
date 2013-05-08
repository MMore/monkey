require 'spec_helper'

describe 'monkey-process-mail' do

  let(:basedir) { File.expand_path '../../..', __FILE__ }

  let(:command) { "#{basedir}/bin/monkey-process-mail" }
  let(:maildir) { "#{basedir}/examples/monkey-process-mail" }

  it "shows usage instructions with --help" do
    output = `#{command} --help 2>&1`
    $?.should be_success
    output.should include("Usage: monkey-process-mail")
  end

  it "processes time recording reports" do
    output = `#{command} --noop < #{maildir}/time_recording.eml 2>&1`
    $?.should be_success
    output.should include("Processing attachment timerec.20130301.20130331.e4.csv")
  end

end