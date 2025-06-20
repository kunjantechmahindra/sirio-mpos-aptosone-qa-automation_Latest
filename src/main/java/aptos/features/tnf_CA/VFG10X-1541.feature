@VFG10X-1541 @PromotionsAndDiscounts @Regression
Feature: VFG10X-1541 Promotions and Discounts _a sales transaction with multiple items with Item level discount for all items_using different discount reason codes

  Scenario: Promotions and Discounts _a sales transaction with multiple items with Item level discount for all items_using different discount reason codes

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 7 items from "General" product to the basket without customer
    And the sales assistant lands on Basket Page

  # Apply item level discount to all items with different reason codes
    And the sales assistant scrolls the basket screen to top
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Customer Accomodation" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    And the sales assistant scrolls the basket screen to top
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    And the sales assistant scrolls the basket screen to top
    And the sales assistant selects the product at index 3
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "In Store Promo" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    And the sales assistant scrolls the basket screen to top
    And the sales assistant selects the product at index 4
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Mall Coupon" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    And the sales assistant selects the product at index 5
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Other" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    And the sales assistant selects the product at index 6
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Post Card Promo" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    And the sales assistant selects the product at index 7
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  # Payment transaction
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
    And the sales assistant validate the the reason code ID 112
    And the sales assistant validate details "Customer Accomodation" in EJ
    And the sales assistant validate the the reason code ID 113
    And the sales assistant validate details "Damaged" in EJ
    And the sales assistant validate the the reason code ID 114
    And the sales assistant validate details "In Store Promo" in EJ
    And the sales assistant validate the the reason code ID 115
    And the sales assistant validate details "Mall Coupon" in EJ
    And the sales assistant validate the the reason code ID 116
    And the sales assistant validate details "Other" in EJ
    And the sales assistant validate the the reason code ID 110
    And the sales assistant validate details "Post Card Promo" in EJ
    And the sales assistant validate the the reason code ID 111
    And the sales assistant validate details "Price Match" in EJ
    And the sales assistant logout from EJViewer