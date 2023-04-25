# frozen_string_literal: true

RSpec.describe 'projects/index' do
  let(:projects) { create_list(:project, 2, title: 'Title', address: 'Address', description: 'MyText') }

  before { assign(:projects, projects) }

  it 'renders a list of projects' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Address'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('open'.to_s), count: 2
  end
end
