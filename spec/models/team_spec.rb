RSpec.describe Team do
  subject { FactoryBot.build(:team) }

  it 'ensures it has a handle' do
    subject.handle = nil
    subject.run_callbacks(:create)

    expect(subject.handle).to eq(subject.name.parameterize)
  end
end
