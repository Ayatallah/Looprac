
#@author Zuishek
Feature: Manage read more in blog

Scenario: When a user creates a post, and then goes to the index of all posts every post should have a snippet of the post under the post's name
Given I am logged in as first user
When I am on the welcome page
And I follow "Blog"
And I follow "New Post"
And I fill in "Title" with "League of Legends"
And I fill in "Text" with "Before the GE Tigers donned cat ears, made their case for schoolboy prep chick, and stormed to an 11-0 domestic record, they were nowhere near the top of the SBENU Champions Spring 2015 preseason ranking. That honor belonged to the once-kings of Korea, Season 3 World Champions SK Telecom T1.With the merged rosters of SK Telecom T1 S and SK Telecom T1 K, the 2015 SK Telecom T1 squad retained a larger amount of talent than most teams following the dismantling of the sister team system. Their 4-1 record during the Spring Preseason told the story of a team poised to regain their former glory in a region that had lost a significant amount of talent."
And I press "Update Post"
And I am on the posts page
Then I should see "Before the GE Tigers"


Scenario: When a user creates a post, and then goes to the index of all posts every post shouldn't have the full text under the post's name

Given I am logged in as first user
When I am on the welcome page
And I follow "Blog"
And I follow "New Post"
And I fill in "Title" with "League of Legends"
And I fill in "Text" with "Before the GE Tigers donned cat ears, made their case for schoolboy prep chick, and stormed to an 11-0 domestic record, they were nowhere near the top of the SBENU Champions Spring 2015 preseason ranking. That honor belonged to the once-kings of Korea, Season 3 World Champions SK Telecom T1.With the merged rosters of SK Telecom T1 S and SK Telecom T1 K, the 2015 SK Telecom T1 squad retained a larger amount of talent than most teams following the dismantling of the sister team system. Their 4-1 record during the Spring Preseason told the story of a team poised to regain their former glory in a region that had lost a significant amount of talent."
And I press "Update Post"
And I am on the posts page
Then I should not see "Before the GE Tigers donned cat ears, made their case for schoolboy prep chick, and stormed to an 11-0 domestic record, they were nowhere near the top of the SBENU Champions Spring 2015 preseason ranking. That honor belonged to the once-kings of Korea, Season 3 World Champions SK Telecom T1.With the merged rosters of SK Telecom T1 S and SK Telecom T1 K, the 2015 SK Telecom T1 squad retained a larger amount of talent than most teams following the dismantling of the sister team system. Their 4-1 record during the Spring Preseason told the story of a team poised to regain their former glory in a region that had lost a significant amount of talent."