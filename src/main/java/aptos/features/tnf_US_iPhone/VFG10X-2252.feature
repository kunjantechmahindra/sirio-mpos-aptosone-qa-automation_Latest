@VFG10X-2252 @StoreSelling @Regression
Feature: VFG10X-2252 Store Selling Functions_ Custom Message Validation_ Full Price store

  Scenario: Store Selling Functions_ Custom Message Validation_ Full Price store

    # Login and add item to basket
    Given the sales assistant login to the application with valid username and password

    # Validate message on landing page
    And the sales assistant lands on Landing Page
    And the sales assistant validate Personalized Landing page message "Are you an XPLR Pass member? Sign in to earn points on every purchase"
    When the sales assistant clicks on Start Basket button

    # Logout from the application
    And the sales assistant logout from the application