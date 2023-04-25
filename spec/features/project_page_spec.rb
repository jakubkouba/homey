# frozen_string_literal: true

describe 'Project page' do
  context 'when project exists' do
    let(:project) { create(:project, title: 'House on the Abbey road') }

    before { visit "/projects/#{project.id}" }

    it 'display the project title' do
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
      expect { submit_form }.not_to change { Project.count }
    end
  end

  describe 'Add comment to project' do
    let(:project) { create(:project) }

    before { visit "/projects/#{project.id}" }

    it 'create comment' do
      within('form#comment') do
        fill_in 'comment_text',	with: 'Some Text'
        click_button 'submit_comment'
      end

      expect(page).to have_current_path("/projects/#{project.id}")
      expect(page).to have_content('Some Text')
    end

    context 'when comment is invalid' do
      before { visit "/projects/#{project.id}" }

      it 'displays errors' do
        within('form#comment') do
          click_button 'submit_comment'
        end

        expect(page).to have_current_path("/projects/#{project.id}")
        expect(page).to have_css('div[data-test-validation-errors-comment="true"]')
      end
    end
  end
end
