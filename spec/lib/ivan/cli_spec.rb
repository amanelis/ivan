require 'spec_helper'

describe Ivan::Cli do
  before {
    $stdout.sync ||=true
    WebMock.disable_net_connect!(:allow_localhost => true)
  }

  describe 'commands' do
    describe 'help' do
      let(:output) { capture(:stdout) { subject.help } }

      it { expect(subject).to_not be_nil }
      it { expect(output).to include('Ivan commands') }
    end

    describe 'rspec_models' do
      context 'when a valid path is passed' do
        let(:output) { capture(:stdout) { subject.rspec_models('./') }}
        it { expect(subject).to_not be_nil }
        it { expect(output).to include('./') }
      end

      context 'when an invalid path is passed' do

      end
    end
  end
end
