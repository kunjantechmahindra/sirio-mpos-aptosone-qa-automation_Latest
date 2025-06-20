@VFG10X-1553 @SaleTransaction @Regression
Feature: VFG10X-1553 Sale Transaction _void sale transaction with reason code as Customer changed Mind

  Scenario: Sale Transaction _void sale transaction with reason code as Customer changed Mind

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant clicks on Basket button from header

   #Void Transaction
    And the sales assistant void the transaction from basket with reason code "Customer Changed Mind"
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate if reason code "Customer Changed Mind" is displayed
    And the sales assistant logout from EJViewer

