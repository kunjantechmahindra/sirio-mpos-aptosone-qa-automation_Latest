@VFG10X-1915 @SaleTransaction @Regression
Feature: VFG10X-1915 Sale Transaction _ Single Item_ Void Transaction _No Customer

  Scenario: Sale Transaction _ Single Item_ Void Transaction _No Customer

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  # Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page

  # Void the transaction
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application