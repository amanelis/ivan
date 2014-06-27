require 'spec_helper'

describe Ivan::Util do
  describe '.validate_models' do
    context 'when a valid path is sent' do
      context 'when rspec' do
        context 'and the path is correct' do
          subject { Ivan::Util.validate_models('./spec/helloworld/') }
          it { expect(subject).to eq(true) }
        end

        context 'and the path is incorrect' do
          subject { Ivan::Util.validate_models('.') }
          it { expect(subject).to eq(false) }
        end
      end
    end
  end

  describe '.normalize_path' do
    context 'when passing "."' do
      context 'the method returns the original path with trailing slash' do
        subject { Ivan::Util.send(:normalize_path, '.') }
        it { expect(subject).to eq('./') }
      end
    end
    context 'when passing "/"' do
      context 'the method returns the original path' do
        subject { Ivan::Util.send(:normalize_path, './') }
        it { expect(subject).to eq('./') }
      end
    end
  end
end
