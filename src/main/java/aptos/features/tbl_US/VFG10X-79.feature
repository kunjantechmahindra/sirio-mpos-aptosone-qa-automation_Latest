@VFG10X-79 @StoreSelling @Regression
Feature: VFG10X-79 Store Selling Functions_ Custom Message Validation_ Outlet store

  Scenario: Store Selling Functions_ Custom Message Validation_ Outlet store

    # Login and add item to basket
    Given the sales assistant login to the application with valid username and password

    # Validate message on landing page
    And the sales assistant lands on Landing Page
    And the sales assistant validate Personalized Landing page message "Remember to ask every customer for their email address"
    When the sales assistant clicks on Start Basket button

    # Logout from the application
    And the sales assistant logout from the application