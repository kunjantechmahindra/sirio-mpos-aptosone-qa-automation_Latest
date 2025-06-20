@VFG10X-269 @PromotionsAndDiscounts @Regression @SmokeTNF
Feature: VFG10X-269 Promotions and Discounts _ Sale Transaction with B1G1F promotion

  Scenario: Promotions and Discounts _ Sale Transaction with B1G1F promotion

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "BOGO-Free" product to the basket without customer
    And the sales assistant selects the product at index 1
    And the sales assistant validate "BOGO" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "BOGO" is applied to item
    And the sales assistant lands on Basket Page

    #Payment transaction with cash
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "BOGO" in EJ
    And the sales assistant logout from EJViewer