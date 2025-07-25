@VFG10X-585 @StoreSelling @Regression @GiftCard
Feature: VFG10X-585 Store Selling Functions _ Minimum Gift Card Issue Amount

  Scenario: Store Selling Functions _ Minimum Gift Card Issue Amount

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Issue New Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 2
    And the sales assistant enters gift card amount "0.00"
    And the sales assistant validates the error message for minimum value
    And the sales assistant validate issue button is disabled
    And the sales assistant enters valid gift card amount "10.00"
    And the sales assistant clicks on issue button
    And the sales assistant clicks on Skip button

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application