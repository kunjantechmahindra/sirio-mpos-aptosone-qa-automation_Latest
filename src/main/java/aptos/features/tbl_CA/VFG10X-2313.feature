@VFG10X-2313 @GiftCard @Regression
Feature: VFG10X-2313 Store Selling Functions _ Not able to top up gift card for zero dollars

  Scenario: Store Selling Functions _ Not able to top up gift card for zero dollars

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Gift card top up with below minimum amount
    And the sales assistant clicks on gift card button
    And the sales assistant validates existing gift card button is enabled
    And the sales assistant enters gift card number from index 2
    And the sales assistant enters minimum gift card amount "0.01"
    And the sales assistant validates the Minimum issue amount error message
    And the sales assistant clicks on cancel button
    And the sales assistant logout from the application