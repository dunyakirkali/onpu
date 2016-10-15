RSpec.shared_examples 'disposable' do
  # Scopes
  describe 'old' do
    let(:old_object) { create(described_class.to_s.underscore.to_sym, :old) }
    let(:new_object) { create(described_class.to_s.underscore.to_sym) }

    it "returns a day old #{described_class}" do
      expect(described_class.old).to include(old_object)
    end

    it "does not return half a day old #{described_class}" do
      expect(described_class.old).not_to include(new_object)
    end
  end
end
