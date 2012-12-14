class SimulatedUser
  def initialize(browser)
    @browser = browser
  end

  def sign_in
    browse do
      visit "/"
      fill_in "nickname", :with => "greg"
      click_button "Sign In"
    end
  end

  def define_goal(message)
    browse do
      fill_in "goal", :with => message
      click_button "Commit to shipping it"
    end

    self
  end

  def view_planned_goal(message)
    browse do
      assert page.has_content?(message),         "Goal text not found"
      assert page.has_button?("I shipped it!"), "'Ship it' button not found"
      assert page.has_button?("I gave up!"),    "'I gave up' button not found"
    end

    self
  end

  def complete_goal
    browse do
      click_button "I shipped it!"
      assert page.has_content?("Congrats!"), "Could not detect goal completion"
    end

    self
  end

  def abandon_goal
    browse do
      click_button "I gave up!"
      assert page.has_field?("goal"), "Could not detect goal abandonment"
    end

    self
  end

  private

  def browse(&block)
    @browser.instance_eval(&block)
  end

end
