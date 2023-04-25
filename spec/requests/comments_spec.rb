RSpec.describe '/comments' do
  let(:comment_params) { build(:comment).slice(:text) }

  describe 'POST /create' do
    subject(:create_comment) { post comments_url, params: { comment: comment_params } }

    context 'when project exists' do
      let!(:project) { create(:project) }

      context 'and comment has valid parameters' do
        let(:comment_params) { build(:comment, text: 'Valid text').slice(:text).merge({ project_id: project.id }) }

        it 'creates a new comment belonging to project' do
          expect { create_comment }.to change { Comment.count }.by(1)
          expect(Comment.last.project_id).to eq project.id
        end

        it 'redirects to the Project' do
          create_comment
          expect(response).to redirect_to(project_url(project.id))
        end
      end

      context 'and comment has invalid parameters' do
        let(:comment_params) { build(:comment, text: '').slice(:text).merge({ project_id: project.id }) }

        it 'does not create a new comment' do
          expect { create_comment }.to change { Comment.count }.by(0)
        end

        it 'redirects to the Project' do
          create_comment
          expect(response).to redirect_to(project_url(project.id))
        end
      end
    end
  end
end
