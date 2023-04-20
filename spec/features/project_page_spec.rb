feature 'Project page' do 
  given(:project) { Project.create(name: 'House on the Abbey road', address: 'Abeby road 2 E23 5KL', description: 'Sellign house to the lovley youg couple') }
  
  scenario "When accessing project page" do
    visit "/project/#{project.id}"

    expect(page).to have_content('House on the Abbey road')
  end
end