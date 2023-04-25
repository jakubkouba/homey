# frozen_string_literal: true

RSpec.describe 'projects/new' do
  before { assign(:project, Project.new) }

  it 'renders new project form' do
    render

    expect(rendered).to have_tag('form', with: { action: '/projects', method: :post }) do
      with_tag 'input', with: { name: 'project[title]' }
      with_tag 'input', with: { name: 'project[address]' }
      with_tag 'textarea', with: { name: 'project[description]' }
      with_tag 'select', with: { name: 'project[status_id]' }
    end
  end
end
