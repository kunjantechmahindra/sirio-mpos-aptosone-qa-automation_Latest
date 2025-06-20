@VFG10X-1759 @DetailedCalculation @Regression
Feature: VFG10X-1759 Sales transaction with XPLR pass

  Scenario: Sales transaction with XPLR pass

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "XPLR-pass" product to the basket without customer

  # Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "XPLR-pass"
    And the sales assistant lands on Basket Page

  # Validate XPLR pass promotion
    And the sales assistant validate price of the item at index 1 after "10%" discount is applied
    And the sales assistant validate total transaction amount
    And the sales assistant selects the product at index 1
    And the sales assistant validate the discount applied as "XPLR pass"
    And the sales assistant clicks on cancel button

  # Complete payment
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application