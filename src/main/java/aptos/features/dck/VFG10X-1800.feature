@VFG10X-1800 @ExchangeTransaction @Regression
Feature: VFG10X-1800 Exchange _Positive Exchange by scanning barcode from e-receipt _Regular Price Items_Sales _Payment by Cash

  Scenario: Exchange _Positive Exchange by scanning barcode from e-receipt _Regular Price Items_Sales _Payment by Cash

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "LowerPrice" product to the basket

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email

  # Save barcode from E-receipt
    Given the sales assistant launch the browser and navigate to YOP mail
    Then the sales assistant save the return barcode from the email receipt
    And the sales assistant closes the browser window.

  # Return transaction
    And the sales assistant lands on Basket Page
    And the sales assistant clicks on return button
    And the sales scan the e-receipt barcode for return
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Wrong Size/Color" as reason code
    And the sales assistant lands on Basket Page
    And the sales assistant add 2 items from "HigherPrice" product to the basket

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant select the printer
    And the sales assistant logout from the application