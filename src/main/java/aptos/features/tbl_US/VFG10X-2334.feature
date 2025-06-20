@VFG10X-2334 @PromotionsAndDiscounts @Regression
Feature: VFG10X-2334 Sale Transaction_Multiple Items apply promotion and Employee Discount (Outlet)

  Scenario: Sale Transaction_Multiple Items apply promotion and Employee Discount (Outlet)

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button


    # Apply coupon
    Then the sales assistant add 2 items from "Coupon-10%" product to the basket without customer
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-10%"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off with coupon" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "10% off with coupon" is applied to item



  # Add Employee discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Employee Sale" is applied to item

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate "Coupon-10%" code in EJ
    And the sales assistant validate details "Employee Sale" in EJ
    And the sales assistant logout from EJViewer