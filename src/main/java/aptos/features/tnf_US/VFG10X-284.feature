@VFG10X-284 @ExchangeTransaction  @Regression @GiftCard @Card @SmokeTNF
Feature: VFG10X-284 Exchange _Positive Exchange by scanning barcode from e-receipt _Multiple Items with Multiple salesperson _Payment by Gift card

  Scenario: Exchange _Positive Exchange by scanning barcode from e-receipt _Multiple Items with Multiple salesperson _Payment by Gift card

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "LowerPrice" product to the basket without customer

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email

  #Save barcode from E-receipt
    Given the sales assistant launch the browser and navigate to YOP mail
    Then the sales assistant save the return barcode from the email receipt
    And the sales assistant closes the browser window.

  #Return transaction
    And the sales assistant lands on Basket Page
    And the sales assistant clicks on return button
    And the sales scan the e-receipt barcode for return
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant lands on Basket Page
    And the sales assistant add 2 items from "HigherPrice" product to the basket

  #Assign sale person for exchange items
    And the sales assistant selects the product at index 3
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "800500" to the transaction item
    Then the sales assistant selects "Yes" from the salesperson popup box
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 4
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "800200" to the transaction item
    Then the sales assistant selects "Yes" from the salesperson popup box
    And sales assistant saves the salesperson name

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 1
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 1
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant validate salesperson name is not printed in physical receipt
    And the sales assistant logout from the application
