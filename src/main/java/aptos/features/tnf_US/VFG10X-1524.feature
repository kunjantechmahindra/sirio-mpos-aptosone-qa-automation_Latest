#script incomplete ##need to confirm unauthorized item exists
@VFG10X-1524 @PromotionsAndDiscounts @Regression
Feature: VFG10X-1541 Promotions and Discounts _Multi-item Employee Discount transaction_verify Employee will be blocked to perform the Employee Discount Transaction when item is not from authorized item group

  Scenario: Promotions and Discounts _Multi-item Employee Discount transaction_verify Employee will be blocked to perform the Employee Discount Transaction when item is not from authorized item group

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer
    And the sales assistant lands on Basket Page

      # Add Employee discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

