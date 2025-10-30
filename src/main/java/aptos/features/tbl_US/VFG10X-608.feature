@VFG10X-608 @PromotionsAndDiscounts @Regression
Feature: VFG10X-608 Promotions and Discounts _ Sale Transactions with Multiple Items _15% discount to first item and 20 $ discount to second item

  Scenario: Promotions and Discounts _ Sale Transactions with Multiple Items _15% discount to first item and 20 $ discount to second item

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  # Apply item level discount
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount percentage as 15
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "TFO CLEARANCE" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Discount - 15%" is applied to item
    And the sales assistant lands on Basket Page

  # Apply item level discount
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant clicks on amount button
    And the sales assistant enter discount amount as 20
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "DAMAGED/DEFECT" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate the discount applied as "20"
    And the sales assistant clicks on cancel button
    And the sales assistant lands on Basket Page

  # Payment transaction
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
    And the sales assistant validate the the reason code ID 79
    And the sales assistant validate details "DAMAGED/DEFECT" in EJ
    And the sales assistant validate the the reason code ID 83
    And the sales assistant validate details "TFO CLEARANCE" in EJ
    And the sales assistant logout from EJViewer