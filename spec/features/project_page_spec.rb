describe 'Project page' do
  context 'when project exists' do
    let(:project) { create(:project, title: 'House on the Abbey road') }
  
    before { visit "/projects/#{project.id}" }

    it "display the project title" do
      expect(page).to have_content('House on the Abbey road')
    end
  end
  
  context 'when submiting empty form' do
    subject(:submit_form) do
      within('form#project') do
        find_button('submit_project').click
      end
    end

    before { visit 'projects/new' }
      
    it 'displays errors' do
      submit_form
      expect(page).to have_css('div[data-test-validation-errors="true"]')
    end

    it 'does not create a Project' do
      expect { submit_form }.to change { Project.count }.by 0 
    end
  end
end
