RSpec.describe User do
  let(:user) { FactoryGirl.create(:user) }

  it 'has a default team' do
    expect(user.team).to be_a(Team)
  end
end
