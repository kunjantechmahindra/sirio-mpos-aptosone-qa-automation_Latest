@VFG10X-294 @Regression @StoreSelling
Feature: VFG10X-294 Store Selling Functions _Terminated Employee to be assigned as a salesperson to a transaction

  Scenario: Store Selling Functions _Terminated Employee to be assigned as a salesperson to a transaction

  # Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  # Assign sale person
    And the sales assistant selects "Salesperson" Option from basket page
    And the sales assistant add terminated salesperson "900600" to the transaction
    And the sales assistant validate invalid error message and navigate to basket

  # Void Transaction
    And the sales assistant void the transaction from basket with reason code "Promo Error"
    And the sales assistant logout from the application