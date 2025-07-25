@VFG10X-47 @SaleTransaction @Regression @SmokeTBL
Feature: VFG10X-47 Sale Transaction _Single Item_ Void Transaction

  Scenario: Sale Transaction _Single Item_ Void Transaction

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant clicks on Basket button from header

  #Void Transaction
    And the sales assistant void the transaction from basket with reason code "Promo Error"
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate if reason code "Promo Error" is displayed
    And the sales assistant logout from EJViewer



