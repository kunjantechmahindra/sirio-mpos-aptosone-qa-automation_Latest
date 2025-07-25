@VFG10X-592 @GiftCard @Regression @Card @StoreSelling
Feature: VFG10X-592 Store Selling Functions _ Not able to issue gift card for zero dollars 0.01

  Scenario: Store Selling Functions _ Not able to issue gift card for zero dollars 0.01

    # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Issue New Gift Card below minimum amount
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 2
    And the sales assistant enters minimum gift card amount "0.01"
    And the sales assistant validates the Minimum issue amount error message
    And the sales assistant clicks on cancel button
    And the sales assistant logout from the application
