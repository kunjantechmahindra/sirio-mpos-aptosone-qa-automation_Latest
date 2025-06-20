@VFG10X-2153 @StoreSelling @Regression @Card @Visa
Feature: VFG10X-2153 Perform a sale transaction - Use Legacy Card- Void Legacy and GC tender - Complete the transaction using GC + Cash+card

  Scenario: Perform a sale transaction - Use Legacy Card- Void Legacy and GC tender - Complete the transaction using GC + Cash+card

    # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 2
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 2
    And the sales assistant validate if partial payment was success

  #Payment Void and Complete transaction
    And the sales assistant voids the partial payment

    # Payment transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 1
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 1
    And the sales assistant validate if partial payment was success
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if another payment was success
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
