@VFG10X-149 @GiftCard @Regression @Card
Feature: VFG10X-149 Gift Card _Top Up Gift card and Suspend

  Scenario: Gift Card _Top Up Gift card and Suspend

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Top up Gift Card and validates suspend button is disabled
    And the sales assistant clicks on gift card button
    And the sales assistant clicks on existing gift card button
    And the sales assistant enters gift card number from index 4
    And the sales assistant enters gift card amount "250.00"
    And the sales assistant clicks on add value button
    And the sales assistant enter the the pin from index 4
    And the sales assistant clicks on Skip button
    And the sales assistant lands on Basket Page
    And the sales assistant validates suspend button is disabled
    And the sales assistant void the transaction with gift card item with reason "Cashier Error"
    And the sales assistant enter the the pin from index 4
    And the sales assistant select the printer
    And the sales assistant logout from the application