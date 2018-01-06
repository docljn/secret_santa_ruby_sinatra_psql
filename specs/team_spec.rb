# team_spec.rb
require("minitest/autorun")
require ("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/team.rb")

class TestTeam < MiniTest::Test

  # TEST FUNCTION NAMING
  # must start with "test_"

  def test_team_initialize_method_takes_name_id
    team = Team.new({'name' => 'E18'})
    assert_equal('E18', team.name)
  end

  def test_
  end

  # TO DO:
  # Find out the difference between "there exists" and "for all" thinking around testing.

end
# team_spec.rb
