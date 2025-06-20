@VFG10X-277 @StoreSelling @Regression
Feature: VFG10X-277 Store Selling Functions_Product search by manually entering the UPC

  Scenario: Store Selling Functions_Product search by manually entering the UPC

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Enter Item UPC
    Then the sales assistant enters the "General" item UPC manually in the basket without customer
    Then the sales assistant verifies that 1 product added to the basket
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application