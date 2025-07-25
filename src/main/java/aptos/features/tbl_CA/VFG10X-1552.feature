@VFG10X-1552 @SaleTransaction @Regression
Feature: VFG10X-1552 Sale Transaction _void sale transaction with reason code as Cashier error

  Scenario: Sale Transaction _void sale transaction with reason code as Cashier error

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page

   #Void Transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate if reason code "Cashier Error" is displayed
    And the sales assistant logout from EJViewer





