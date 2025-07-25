@VFG10X-82 @Regression @StoreSelling
Feature: VFG10X-82 Store Selling Functions_ Transactional Level Sales person Assignment

  Scenario: Store Selling Functions_ Transactional Level Sales person Assignment

      # Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

      # Assign sale person
    And the sales assistant selects "Salesperson" Option from basket page
    And the sales assistant add salesperson "900500" to the transaction

      # Void Transaction
    And the sales assistant void the transaction from basket with reason code "Promo Error"
    And the sales assistant logout from the application






