require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    assign(:project, Project.create!(
      title: "Title",
      address: "Address",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
  end
end
