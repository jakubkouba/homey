feature 'Project page' do 
  given(:project) { Project.create(title: 'House on the Abbey road', address: 'Abeby road 2 E23 5KL', description: 'Sellign house to the lovley youg couple') }
  
  scenario "When accessing project page" do
    visit "/projects/#{project.id}"

    expect(page).to have_content('House on the Abbey road')
  end
end