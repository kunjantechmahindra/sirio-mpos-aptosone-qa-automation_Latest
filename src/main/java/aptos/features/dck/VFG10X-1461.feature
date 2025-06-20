@VFG10X-1461 @SaleTransaction @Regression @GiftCard @Card @SmokeDCK
Feature: VFG10X-1461 Gift Card - Issue a new gift card

  Scenario: Gift Card - Issue a new gift card

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Issue New Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 2
    And the sales assistant enters gift card amount "100.00"
    And the sales assistant clicks on issue button

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application