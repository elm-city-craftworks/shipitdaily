require 'test_helper'

class DefiningAGoalTest < ActionDispatch::IntegrationTest
  setup do
    @user = SimulatedUser.new(self)
  end

  test "must be able to successfully complete a goal" do
    @user.sign_in

    goal = "I want to pass this acceptance test"

    @user.define_goal(goal)
         .view_planned_goal(goal)
         .complete_goal
  end

  test "must be able to abandon a goal" do
    @user.sign_in

    goal = "I want to pass this acceptance test"

    @user.define_goal(goal)
         .view_planned_goal(goal)
         .abandon_goal
  end
end
