require('spec_helper')

describe(Team) do
  describe("#players") do
    it("tells which players are in it") do
      test_team = Team.create({:name => "Knighthawks"})
      test_player1 = Player.create({:name => "player1", :team_id => test_team.id()})
      test_player2 = Player.create({:name => "player2", :team_id => test_team.id()})
      test_player3 = Player.create({:name => "player3", :team_id => test_team.id()})
     expect(test_team.players()).to(eq([test_player1, test_player2, test_player3]))
    end
  end
end
