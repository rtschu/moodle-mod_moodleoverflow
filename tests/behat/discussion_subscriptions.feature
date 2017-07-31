@mod @mod_moodleoverflow
Feature: A user can control their own subscription preferences for a discussion
  In order to receive notifications for things I am interested in
  As a user
  I need to choose my discussion subscriptions

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email |
      | student1 | Student   | One      | student.one@example.com |
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1 | 0 |
    And the following "course enrolments" exist:
      | user | course | role |
      | student1 | C1 | student |
    And I log in as "admin"
    And I am on site homepage
    And I follow "Course 1"
    And I turn editing mode on

  Scenario: An optional moodleoverflow can have discussions subscribed to
    Given I add a "Moodleoverflow" to section "1" and I fill the form with:
      | Moodleoverflow name | Test moodleoverflow name |
      | Description         | Test moodleoverflow description |
      | Subscription mode   | Optional subscription |
    And I add a new discussion to "Test moodleoverflow name" moodleoverflow with:
      | Subject | Test post subject one |
      | Message | Test post message one |
    And I add a new discussion to "Test moodleoverflow name" moodleoverflow with:
      | Subject | Test post subject two |
      | Message | Test post message two |
    And I log out
    When I log in as "student1"
    And I follow "Course 1"
    And I follow "Test moodleoverflow name"
    Then I should see "Subscribe to this moodleoverflow"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject two" "table_row"
    And I click on "You are not subscribed to this discussion. Click to subscribe." "link" in the "Test post subject one" "table_row"
    And I should see "Student One will be notified of new posts in 'Test post subject one' of 'Test moodleoverflow name'"
    And I should see "Subscribe to this moodleoverflow"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject two" "table_row"
    And I click on "You are subscribed to this discussion. Click to unsubscribe." "link" in the "Test post subject one" "table_row"
    And I should see "Student One will NOT be notified of new posts in 'Test post subject one' of 'Test moodleoverflow name'"
    And I should see "Subscribe to this moodleoverflow"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject two" "table_row"
    And I click on "You are not subscribed to this discussion. Click to subscribe." "link" in the "Test post subject one" "table_row"
    And I should see "Student One will be notified of new posts in 'Test post subject one' of 'Test moodleoverflow name'"
    And I should see "Subscribe to this moodleoverflow"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject two" "table_row"
    And I follow "Subscribe to this moodleoverflow"
    And I should see "Student One will be notified of new posts in 'Test moodleoverflow name'"
    And I should see "Unsubscribe from this moodleoverflow"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject two" "table_row"
    And I follow "Unsubscribe from this moodleoverflow"
    And I should see "Student One will NOT be notified of new posts in 'Test moodleoverflow name'"
    And I should see "Subscribe to this moodleoverflow"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject two" "table_row"

  Scenario: An automatic subscription moodleoverflow can have discussions unsubscribed from
    Given I add a "Moodleoverflow" to section "1" and I fill the form with:
      | moodleoverflow name | Test moodleoverflow name |
      | Description         | Test moodleoverflow description |
      | Subscription mode   | Auto subscription |
    And I add a new discussion to "Test moodleoverflow name" moodleoverflow with:
      | Subject | Test post subject one |
      | Message | Test post message one |
    And I add a new discussion to "Test moodleoverflow name" moodleoverflow with:
      | Subject | Test post subject two |
      | Message | Test post message two |
    And I log out
    When I log in as "student1"
    And I follow "Course 1"
    And I follow "Test moodleoverflow name"
    Then I should see "Unsubscribe from this moodleoverflow"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject two" "table_row"
    And I click on "You are subscribed to this discussion. Click to unsubscribe." "link" in the "Test post subject one" "table_row"
    And I should see "Student One will NOT be notified of new posts in 'Test post subject one' of 'Test moodleoverflow name'"
    And I should see "Unsubscribe from this moodleoverflow"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject two" "table_row"
    And I click on "You are not subscribed to this discussion. Click to subscribe." "link" in the "Test post subject one" "table_row"
    And I should see "Student One will be notified of new posts in 'Test post subject one' of 'Test moodleoverflow name'"
    And I should see "Unsubscribe from this moodleoverflow"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject two" "table_row"
    And I click on "You are subscribed to this discussion. Click to unsubscribe." "link" in the "Test post subject one" "table_row"
    And I should see "Student One will NOT be notified of new posts in 'Test post subject one' of 'Test moodleoverflow name'"
    And I should see "Unsubscribe from this moodleoverflow"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject two" "table_row"
    And I follow "Unsubscribe from this moodleoverflow"
    And I should see "Student One will NOT be notified of new posts in 'Test moodleoverflow name'"
    And I should see "Subscribe to this moodleoverflow"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are not subscribed to this discussion. Click to subscribe." "link" should exist in the "Test post subject two" "table_row"
    And I follow "Subscribe to this moodleoverflow"
    And I should see "Student One will be notified of new posts in 'Test moodleoverflow name'"
    And I should see "Unsubscribe from this moodleoverflow"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject one" "table_row"
    And "You are subscribed to this discussion. Click to unsubscribe." "link" should exist in the "Test post subject two" "table_row"

 Scenario: A guest should not be able to subscribe to a discussion
   Given I am on site homepage
   And I add a "Moodleoverflow" to section "1" and I fill the form with:
     | Moodleoverflow name | Test moodleoverflow name |
     | Description         | Test moodleoverflow description |
   And I add a new discussion to "Test moodleoverflow name" moodleoverflow with:
     | Subject | Test post subject one |
     | Message | Test post message one |
   And I log out
   When I log in as "guest"
   And I follow "Test moodleoverflow name"
   Then "You are not subscribed to this discussion. Click to subscribe." "link" should not exist in the "Test post subject one" "table_row"
   And "You are subscribed to this discussion. Click to unsubscribe." "link" should not exist in the "Test post subject one" "table_row"
   And I follow "Test post subject one"
   And "You are not subscribed to this discussion. Click to subscribe." "link" should not exist
   And "You are subscribed to this discussion. Click to unsubscribe." "link" should not exist

 Scenario: A user who is not logged in should not be able to subscribe to a discussion
   Given I am on site homepage
   And I add a "Moodleoverflow" to section "1" and I fill the form with:
     | Moodleoverflow name | Test moodleoverflow name |
     | Description         | Test moodleoverflow description |
   And I add a new discussion to "Test moodleoverflow name" moodleoverflow with:
     | Subject | Test post subject one |
     | Message | Test post message one |
   And I log out
   When I follow "Test moodleoverflow name"
   Then "You are not subscribed to this discussion. Click to subscribe." "link" should not exist in the "Test post subject one" "table_row"
   And "You are subscribed to this discussion. Click to unsubscribe." "link" should not exist in the "Test post subject one" "table_row"
   And I follow "Test post subject one"
   And "You are not subscribed to this discussion. Click to subscribe." "link" should not exist
   And "You are subscribed to this discussion. Click to unsubscribe." "link" should not exist