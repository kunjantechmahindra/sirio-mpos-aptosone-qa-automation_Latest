@VFG10X-1964 @StoreSelling @Regression
Feature: VFG10X-1964 Store Selling Functions_Landing page_Close Terminal and Cancel and Basket Validation

  Scenario: Store Selling Functions_Landing page_Close Terminal and Cancel and Basket Validation

 # Login and add item to basket
    Given the sales assistant login to the application with valid username and password

    #Validate Start Basket, Hamburger options, Sign Out functionality
    And the sales assistant lands on Landing Page
    When the sales assistant verifies the Start Basket button
    When the sales assistant validates the Hamburger Menu options
    And the sales assistant validates the Close Terminal function and cancel the operation
    And the sales assistant clicks on back button on store operations page
    And the sales assistant lands on Basket Page
    And the sales assistant logout from the application







