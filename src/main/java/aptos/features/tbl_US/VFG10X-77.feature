@VFG10X-77 @Regression @StoreSelling
Feature: VFG10X-77 Store Selling Functions_ Landing Page Validation

  Scenario: Store Selling Functions_ Landing Page Validation

    # Login
    Given the sales assistant login to the application with valid username and password

    # Validate the Landing page and logout
    When the sales assistant verifies the Start Basket button
    When the sales assistant clicks on Start Basket button
    And the sales assistant logout from the application