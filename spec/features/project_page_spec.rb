describe 'Project page' do
  context 'when project exists' do
    let(:project) { create(:project, title: 'House on the Abbey road') }
  
    before { visit "/projects/#{project.id}" }

    it "display the project title" do
      expect(page).to have_content('House on the Abbey road')
    end
  end

  context 'when subniting form with empty title' do
    before do
      visit 'projects/new'
      click_button('Create Project')
    end
      
    it 'display an error' do
      within('from#project-form') do
        expect(page).to have_selector('li:data-error-title')
      end
    end
  end
end
