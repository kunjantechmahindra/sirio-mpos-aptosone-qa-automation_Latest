@VFG10X-148 @GiftCard @Regression @Card
Feature: VFG10X-148 Gift Card _ Issue of New Gift Card and Suspend

  Scenario: Gift Card _ Issue of New Gift Card and Suspend

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Issue New Gift Card and validates suspend button is disabled
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 7
    And the sales assistant enters gift card amount "50.00"
    And the sales assistant clicks on issue button
    And the sales assistant clicks on Skip button
    And the sales assistant lands on Basket Page
    And the sales assistant validates suspend button is disabled
    And the sales assistant void the transaction with gift card item with reason "Cashier Error"
    #And the sales assistant enter the the pin from index 6
    And the sales assistant select the printer
    And the sales assistant logout from the application
