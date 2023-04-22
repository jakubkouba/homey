RSpec.describe '/comments' do
  let(:valid_attributes) { build(:comment).slice(:text) }

  describe 'POST /create' do
    subject(:create_comment) { post comments_url, params: { comment: valid_attributes } }

    context 'when project exists' do
      let!(:project) { create(:project) }

      context 'and comment has valid parameters' do
        let(:valid_attributes) { build(:comment, text: 'Valid text').slice(:text).merge({ project_id: project.id }) }

        it 'creates a new comment belonging to project' do
          expect { create_comment }.to change { Comment.count }.by(1)
          expect(Comment.last.project_id).to eq project.id
        end

        it 'redirects to the Project' do
          create_comment
          expect(response).to redirect_to(project_url(project.id))
        end
      end
    end
  end
end
