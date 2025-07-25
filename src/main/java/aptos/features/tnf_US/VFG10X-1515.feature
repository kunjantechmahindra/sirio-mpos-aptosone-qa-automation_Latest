@VFG10X-1515 @Regression @GiftCard @Card
Feature: VFG10X-1515 Gift Card _Sale Transaction with payment by swiping the Gift Card + WRONG PIN - Then entering the correct PIN

  Scenario: Gift Card _Sale Transaction with payment by swiping the Gift Card + WRONG PIN - Then entering the correct PIN

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 0
    And the sales assistant clicks on redeem button
    And the sales assistant enter wrong pin number from index 4
    And the sales assistant close the invalid pin pop up window
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 3
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 3
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application