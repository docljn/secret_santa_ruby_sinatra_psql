# team_spec.rb
require("minitest/autorun")
require ("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/team.rb")
require_relative("../db/sql_runner.rb")

class TestTeam < MiniTest::Test

  # TEST FUNCTION NAMING
  # must start with "test_"

  def setup
    %x`psql -d santa_test -f ../db/santa_test.sql`
    @team = Team.new({'name' => 'E18'})
  end


  def test_team_initialize_method_takes_name
    assert_equal('E18', @team.name)
  end

  def test_insert_saves_to_database_creating_id
    @team.insert
    assert_equal('1', @team.id)
  end



  # TO DO:
  # Find out the difference between "there exists" and "for all" thinking around testing.

end
# team_spec.rb
