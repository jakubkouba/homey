# frozen_string_literal: true

RSpec.describe '/projects' do
  # This should return the minimal set of attributes required to create a valid
  # Project. As you add validations to Project, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { build(:project).slice(:title, :address, :description) }

  let(:invalid_attributes) do
    build(:project, title: 'A' * 101, address: '@$', description: 'Some description').slice(:title, :address,
                                                                                            :description)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Project.create! valid_attributes
      get projects_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      project = Project.create! valid_attributes
      get project_url(project)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_project_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      project = Project.create! valid_attributes
      get edit_project_url(project)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Project' do
        expect do
          post projects_url, params: { project: valid_attributes }
        end.to change(Project, :count).by(1)
      end

      it 'redirects to the created project' do
        post projects_url, params: { project: valid_attributes }
        expect(response).to redirect_to(project_url(Project.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Project' do
        expect do
          post projects_url, params: { project: invalid_attributes }
        end.not_to change(Project, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post projects_url, params: { project: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested project' do
        project = Project.create! valid_attributes
        patch project_url(project), params: { project: new_attributes }
        project.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the project' do
        project = Project.create! valid_attributes
        patch project_url(project), params: { project: new_attributes }
        project.reload
        expect(response).to redirect_to(project_url(project))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        project = Project.create! valid_attributes
        patch project_url(project), params: { project: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested project' do
      project = Project.create! valid_attributes
      expect do
        delete project_url(project)
      end.to change(Project, :count).by(-1)
    end

    it 'redirects to the projects list' do
      project = Project.create! valid_attributes
      delete project_url(project)
      expect(response).to redirect_to(projects_url)
    end
  end
end
