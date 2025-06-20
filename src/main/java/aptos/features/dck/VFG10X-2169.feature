@VFG10X-2169 @SaleTransaction @Regression
Feature: VFG10X-2169 Sale Transaction _Void sale transaction with reason code as Promo error

  Scenario: Sale Transaction _Void sale transaction with reason code as Promo error

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

    #Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page

    #Void Transaction
    And the sales assistant void the transaction from basket with reason code "Promo Error"
    And the sales assistant logout from the application

