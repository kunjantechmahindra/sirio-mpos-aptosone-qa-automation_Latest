@VFG10X-430 @PromotionsAndDiscounts @Regression @SmokeTNF
Feature: VFG10X-430 Promotions and Discounts _ Allow Item level Discount _User level 40 and discount equal to 70%

  Scenario: Promotions and Discounts _ Allow Item level Discount _User level 40 and discount equal to 70%

  # Login and add item to basket add items
    Given the sales assistant logs in to the application with "above" security level
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Discount Applying item level discount security metric
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant enter discount percentage as 70
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application