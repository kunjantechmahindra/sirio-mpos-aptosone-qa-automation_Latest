@VFG10X-1545 @PromotionsAndDiscounts @Regression
Feature: VFG10X-1545  Promotions and Discounts _Transactional level discount reason code -Damaged in TNF and BOUNCEBACK in TBL

  Scenario: Promotions and Discounts _Transactional level discount reason code -Damaged in TNF and BOUNCEBACK in TBL

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "HigherPrice" product to the basket without customer

  #Apply transactional level discount
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And sales assistant validates transactional level discount 10 applied

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

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate the the reason code ID 133
    And the sales assistant validate details "Damaged" in EJ
    And the sales assistant validate details "Transaction Discount" in EJ
    And the sales assistant logout from EJViewer
