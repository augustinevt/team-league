require('spec_helper')

describe('Team resource', {type: :feature}) do
  it 'should list all the teams on /teams' do
    new_team = Team.create(name: "Batmen")
    visit('/teams')
    expect(page).to have_content('Batmen')
  end

end
