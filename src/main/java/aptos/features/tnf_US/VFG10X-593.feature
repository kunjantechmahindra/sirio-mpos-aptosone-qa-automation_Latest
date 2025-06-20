@VFG10X-593 @GiftCard @Regression @Card @StoreSelling
Feature: VFG10X-593 Store Selling Functions _ Not able to issue gift card for above 1000 dollars (TNF)/500 dollars (TBL)

  Scenario: Store Selling Functions _ Not able to issue gift card for above 1000 dollars (TNF)/500 dollars (TBL)

    # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Issue New Gift Card above maximum amount
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 2
    And the sales assistant enters maximum gift card amount "1000.01"
    And the sales assistant validates the Maximum issue amount error message
    And the sales assistant clicks on cancel button
    And the sales assistant logout from the application