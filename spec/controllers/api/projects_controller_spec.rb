RSpec.describe Api::ProjectsController do
  let(:user) { FactoryBot.create(:user) }
  let(:team) { FactoryBot.create(:team, users: [user]) }

  before do
    sign_in user
  end

  describe 'GET index' do
    let!(:projects) { FactoryBot.create_list(:project, 5, team: team) }

    it 'gets the list of projects for a team' do
      get :index, params: { team_id: team.id }

      expect(response).to have_http_status(:ok)
      expect(response_json.count).to eq(5)
    end
  end

  describe 'GET show' do
    let(:project) { FactoryBot.create(:project, team: team) }

    it 'gets a project for a team' do
      get :show, params: { team_id: team.id, id: project.id }

      expect(response).to have_http_status(:ok)
      expect(response_json[:id]).to eq(project.id)
    end
  end

  describe 'POST create' do
    let(:project) { Project.last }

    let(:org) { Faker::Internet.user_name }
    let(:repo) { Faker::Internet.user_name }
    let(:github_id) { Faker::Number.positive.to_i }

    it 'creates a new project' do
      expect {
        post :create, params: { team_id: team.id, github_id: github_id, org: org, repo: repo }
        expect(response).to have_http_status(:ok)
      }.to change { Project.count }.by(1)

      expect(project.github_id).to eq(github_id)
      expect(project.org).to eq(org)
      expect(project.repo).to eq(repo)
    end
  end
end
