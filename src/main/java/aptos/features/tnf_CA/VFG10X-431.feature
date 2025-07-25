@VFG10X-431 @PromotionsAndDiscounts @Regression
Feature: VFG10X-431 Promotions and Discounts _ Allow Transaction level Discount _User level 40 or above and discount equal to Max discount allowed

  Scenario: Promotions and Discounts _ Allow Transaction level Discount _User level 40 or above and discount equal to Max discount allowed

  #Login and add item to basket add items
    Given the sales assistant logs in to the application with "above" security level
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Discount at transaction level
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 101
    #And the sales assistant validates the Maximum issue amount error message
    And the sales assistant enter discount percentage as 100
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application
