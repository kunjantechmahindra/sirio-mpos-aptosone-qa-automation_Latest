@VFG10X-31 @SaleTransaction @Regression
Feature: VFG10X-31 Sale Transaction _Single Item with Promo(Percentage Off)_ Pay using RCM Tender_ Existing Customer

  Scenario: Sale Transaction _Single Item with Promo(Percentage Off)_ Pay using RCM Tender_ Existing Customer

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 0
    Then the sales assistant add 2 items from "General" product to the basket

    #Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-AllItem"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant lands on Basket Page

    #Complete payment by RCM tenders
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on More button
    And the sales assistant clicks on RCM Tenders
    And the sales assistant clicks on RCM Reason code "RCM CUST ACCMD"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "RCM CUST ACCMD" in EJ
    And the sales assistant logout from EJViewer