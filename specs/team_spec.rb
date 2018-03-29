# team_spec.rb
require("minitest/autorun")
require ("minitest/reporters")
require ("pry-byebug")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/team.rb")
require_relative("../db/sql_runner.rb")

class TestTeam < MiniTest::Test

  # TEST FUNCTION NAMING
  # must start with "test_"

  def setup
    # run before each test
    %x`psql -d santa_test -f ../db/santa_test.sql`
    @team = Team.new({'name' => 'E18'})
    @team.insert
    @team2 = Team.new({'name' => 'Team2'})
    @team2.insert
    @team3 = Team.new({'name' => 'Team3'})
    @team3.insert
    # consider moving this to a seed data file?
  end

  def teardown
    # run after each test
  end


  def test_team_initialize_method_takes_name
    assert_equal('E18', @team.name)
  end

  def test_insert_saves_to_database_creating_id
    assert_equal('1', @team.id)
  end

  def test_select_all_returns_array_of_objects
    teams = Team.select_all()
    assert_equal(3, teams.length)
  end

  def test_select_one_returns_name_id
    selected = Team.select_one(1)
    assert_equal('E18', selected.name)
  end

  def test_delete_one_reduces_number_of_table_entries
    initial_count = Team.select_all().length
    Team.delete_one(1)
    after_delete_one = Team.select_all().length
    assert_equal(1, initial_count-after_delete_one)
  end

  def test_delete_all_removes_all_table_entries
    Team.delete_all()
    assert_equal([], Team.select_all())
  end

  def test_update_saves_to_database_retaining_id
    selected = Team.select_one(1)
    selected.name = 'E19'
    selected.update
    read = Team.select_one(1)
    assert_equal(1, read.id)
    assert_equal('E19', read.name)
  end

  # TO DO:
  # Find out the difference between "there exists" and "for all" thinking around testing.

end
# team_spec.rb
