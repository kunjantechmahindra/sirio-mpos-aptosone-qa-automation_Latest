@VFG10X-1023 @PromotionsAndDiscounts @Regression
Feature: VFG10X-1023 Promotions and Discounts _Transaction level Discount_In a Sale transaction with 2 items, Apply 30% OFF

  Scenario: Promotions and Discounts _Transaction level Discount_In a Sale transaction with 2 items, Apply 30% OFF

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #Transactional level percentage 30% off
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount percentage as 30
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant save sale amount details
    And the sales assistant validate transactional level percentage off 30 applied for 2 items

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Transaction Discount" in EJ
    And the sales assistant validate details "Percent Off" in EJ
    And the sales assistant validate details "30" in EJ
    And the sales assistant logout from EJViewer
