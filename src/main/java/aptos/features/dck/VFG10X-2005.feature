@VFG10X-2005 @SaleTransaction @Regression @Card @Amex
Feature: VFG10X-2005 Sale Transaction _Multiple Item _Pay with Card

  Scenario: Sale Transaction _Multiple Item _Pay with Card

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

    #Payment transaction with card
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "amex" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer

    # Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    #And the sales assistant clicks on Payment auth details
    #And the sales assistant validate details "visa" in EJ
    #And the sales assistant validate details "GOODS_SERVICES" in EJ
    And the sales assistant logout from EJViewer