@VFG10X-1407 @GiftCard @Regression @Card
Feature: VFG10X-1407 Gift Card _Sales of new gift card and Void transaction

  Scenario: Gift Card _Sales of new gift card and Void transaction

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Issue New Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 1
    And the sales assistant enters gift card amount "50.00"
    And the sales assistant clicks on issue button
    And the sales assistant clicks on Skip button
    And the sales assistant void the transaction with gift card item with reason "Cashier Error"
    And the sales assistant enter the the pin from index 1
    And the sales assistant select the printer
    And the sales assistant logout from the application