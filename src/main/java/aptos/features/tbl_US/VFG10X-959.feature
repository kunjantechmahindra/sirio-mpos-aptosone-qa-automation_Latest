@VFG10X-959 @ExchangeTransaction @Regression
Feature: VFG10X-959 Exchange _Positive Blind Exchange transaction with multiple items with Promo on exchange transaction_Payment by Cash with change

  Scenario: Exchange _Positive Blind Exchange transaction with multiple items with Promo on exchange transaction_Payment by Cash with change

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

  # Add Product
    Then the sales assistant add an items from "LowerPrice" product for return
    And the sales assistant selects "DAMAGED/DEFECTIVE" as reason code
    And the sales assistant clicks on Skip button
    Then the sales assistant add an items from "LowerPrice" product for return
    And the sales assistant selects "CHANGED MIND" as reason code
    And the sales assistant navigate to basket page from return mode page
    Then the sales assistant add 1 items from "WithOutCoupon-10%" product to the basket
    Then the sales assistant add 1 items from "HigherPrice" product to the basket

  # Payment transaction
    And the sales assistant clicks on Pay button
    And  the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enter extra amount
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant validate change due amount
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant select the printer
    And the sales assistant logout from the application