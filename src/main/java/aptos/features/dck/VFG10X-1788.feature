@VFG10X-1788 @PromotionsAndDiscounts @Regression @SmokeDCK
Feature: VFG10X-1788 Promotions and Discounts _Sale with Multiple Line Items_BOGO 50% OFF

  Scenario: Promotions and Discounts _Sale with Multiple Line Items_BOGO 50% OFF

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "BOGO@50%" product to the basket
    And the sales assistant selects the product at index 1
    And the sales assistant validate "BOGO 50%" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "BOGO 50%" is applied to item
    And the sales assistant lands on Basket Page

    #Add normal item to the basket
    And the sales assistant add 2 items from "General" product to the basket

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
    And the sales assistant validate details "BOGO 50%" in EJ
    And the sales assistant logout from EJViewer