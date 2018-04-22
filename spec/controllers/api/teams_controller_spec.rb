RSpec.describe Api::TeamsController do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe 'GET index' do
    let(:teams) { FactoryBot.create_list(:team, 5)}

    it 'gets the list of teams for the current user' do
      teams.first.users << user
      get :index

      expect(response).to have_http_status(:ok)
      expect(response_json.count).to eq(1)
    end
  end
end
