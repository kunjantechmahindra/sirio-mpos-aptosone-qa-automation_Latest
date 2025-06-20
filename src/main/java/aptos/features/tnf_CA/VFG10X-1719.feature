@VFG10X-1719 @Suspend @SaleTransaction @Regression
Feature: VFG10X-1719 Sale Transaction _ Suspend transaction from payment page

  Scenario: Sale Transaction _ Suspend transaction from payment page

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Suspend and Resume Transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    #And the sales assistant validate the payment details
    And the sales assistant validate details "Transaction suspended" in EJ
    And the sales assistant logout from EJViewer