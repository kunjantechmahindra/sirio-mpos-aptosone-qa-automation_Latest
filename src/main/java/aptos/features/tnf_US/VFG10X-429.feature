#T.C is blocked due to a defect and script is not completed

@VFG10X-429 @PromotionsAndDiscounts @Regression
Feature: VFG10X-429 Promotions and Discounts _ Block Item level Discount _User level below 30

  Scenario: Promotions and Discounts _ Block Item level Discount _User level below 30

  #Login and add item to basket add items
    Given the sales assistant logs in to the application with "below" security level
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Discount Applying item level discount security metric
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 24
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validate manager approval is displayed and discount is blocked
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
