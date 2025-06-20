@VFG10X-93 @StoreSelling @Regression @SmokeTesting
Feature: VFG10X-93 Store Selling Functions _Gift card Quick Choice Options

  Scenario: Store Selling Functions _Gift card Quick Choice Options

  # Login and gift card quick choice option validation
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    And the sales assistant clicks on gift card button
    And the sales assistant validates gift card quick choice buttons are enabled
    And the sales assistant logout from the application