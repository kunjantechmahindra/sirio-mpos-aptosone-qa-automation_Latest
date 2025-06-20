@VFG10X-292 @StoreSelling @Regression
Feature: VFG10X-292 Store Selling Functions _Personalized Landing Page Message

  Scenario: Store Selling Functions _Personalized Landing Page Message

  #Login and lands on landing page
    Given the sales assistant login to the application with valid username and password
    And the sales assistant lands on Landing Page
    And the sales assistant validate Personalized Landing page message "Remember to ask every customer for their email address."

  #Navigate to basket page and logout from the application
    When the sales assistant clicks on Start Basket button
    And the sales assistant lands on Basket Page
    Then the sales assistant logout from the application
