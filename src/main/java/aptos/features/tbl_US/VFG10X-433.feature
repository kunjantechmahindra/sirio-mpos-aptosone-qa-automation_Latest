@VFG10X-433 @PromotionsAndDiscounts @Regression
Feature: VFG10X-433 Promotions and Discounts _ Block Transactional level Discount _Discount percentage above 30 for TBL

  Scenario: Promotions and Discounts _ Block Transactional level Discount _Discount percentage above 30 for TBL

    # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

    # Add transaction level discount
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 31
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "E-MAIL" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validate error message for exceeding discount threshold value
    And the sales assistant clicks on cancel button

    # Void Transaction
    And the sales assistant void the transaction from basket with reason code "Customer Changed Mind"
    And the sales assistant logout from the application