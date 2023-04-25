# frozen_string_literal: true

RSpec.describe 'projects/edit' do
  let(:project) { create(:project) }

  before { assign(:project, project) }

  it 'renders the edit project form' do
    render

    expect(rendered).to have_tag('form', with: { action: "/projects/#{project.id}", method: :post }) do
      with_tag 'input', with: { name: 'project[title]' }
      with_tag 'input', with: { name: 'project[address]' }
      with_tag 'textarea', with: { name: 'project[description]' }
      with_tag 'select', with: { name: 'project[status_id]' }
    end
  end
end
