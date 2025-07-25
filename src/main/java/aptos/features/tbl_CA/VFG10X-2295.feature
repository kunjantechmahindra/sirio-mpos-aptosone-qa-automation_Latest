@VFG10X-2295 @GiftCard @Regression @Card
Feature: VFG10X-2295 Gift Card _ Issue of New Gift Card by typing the incorrect gift card number_ Validate the error message

  Scenario: Gift Card _ Issue of New Gift Card by typing the incorrect gift card number_ Validate the error message

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Issue New Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 6
    And the sales assistant enters gift card amount "50.00"
    And the sales assistant clicks on issue button
    And the sales assistant validates the error message
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application