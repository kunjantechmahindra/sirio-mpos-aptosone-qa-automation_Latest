@VFG10X-37 @SaleTransaction @Regression
Feature: VFG10X-37 Sale Transaction _ Single Item_ Void Transaction _No Customer

  Scenario: Sale Transaction _ Single Item_ Void Transaction _No Customer

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer
    And the sales assistant void the transaction from basket with reason code "Cashier Error"

    #Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant clicks on Basket button from header
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate details "Transaction voided" in EJ
    And the sales assistant logout from EJViewer