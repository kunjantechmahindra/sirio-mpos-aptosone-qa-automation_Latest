@VFG10X-2108 @StoreSelling @Regression

Feature: VFG10X-2108 Store Selling Functions _Landing page after every sign in

  Scenario: Store Selling Functions _Landing page after every sign in

  #Login and lands on landing page
    Given the sales assistant login to the application with valid username and password
    And the sales assistant lands on Landing Page

  #Navigate to basket page and logout from the application
    When the sales assistant clicks on Start Basket button
    And the sales assistant lands on Basket Page
    Then the sales assistant logout from the application

  #Login again and lands on landing page
    Given the sales assistant login to the application with valid username and password
    And the sales assistant lands on Landing Page

  #Navigate to basket page and logout from the application
    When the sales assistant clicks on Start Basket button
    And the sales assistant logout from the application