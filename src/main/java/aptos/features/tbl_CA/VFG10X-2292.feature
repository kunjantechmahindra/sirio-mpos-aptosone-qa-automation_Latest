@VFG10X-2292 @Regression @GiftCard

Feature: VFG10X-2292 Gift Card _ Validate that PIN Entering is not required while Top up

  Scenario: Gift Card _ Validate that PIN Entering is not required while Top up

  #Login and gift card top up functionality without entering PIN
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    And the sales assistant clicks on gift card button
    And the sales assistant validates existing gift card button is enabled
    And the sales assistant enters gift card number from index 2
    And the sales assistant enters gift card amount "50.00"
    And the sales assistant clicks on add value button
    And the sales assistant clicks on Skip button
    And the sales assistant void the transaction with gift card item with reason "Cashier Error"
    And the sales assistant select the printer
    And the sales assistant logout from the application