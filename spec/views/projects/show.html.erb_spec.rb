# frozen_string_literal: true

RSpec.describe 'projects/show' do
  let(:project) { create(:project, title: 'Title', address: 'Address', description: 'MyText', status: status) }
  let(:status) { create(:status, title: 'AML') }

  before do
    assign(:project, project)
    assign(:comment, build(:comment))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/AML/)
  end

  it 'renders project with comment form' do
    render

    expect(rendered).to have_tag('form', with: { action: '/comments', method: :post }) do
      with_tag 'input', with: { name: 'comment[text]' }
      with_tag 'input', with: { name: 'comment[project_id]', value: project.id, type: :hidden }
    end
  end

  context 'when Project has a message' do
    let(:project_with_comment) { create(:project, status: status) }
    let!(:comment) { create(:comment, text: 'Some message', project: project_with_comment) }

    before { assign(:project, project_with_comment) }

    it 'will contain the message text' do
      render

      expect(rendered).to match(/Some message/)
    end
  end
end
