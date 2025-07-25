@VFG10X-1463 @Regression @GiftCard @Card
Feature: VFG10X-1463 Gift Card - Sale transaction - payment using gift card (Redeem)

  Scenario: Gift Card - Sale transaction - payment using gift card (Redeem)

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

 #Add Product
    Then the sales assistant add 1 items from "General" product to the basket

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 1
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 1
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application