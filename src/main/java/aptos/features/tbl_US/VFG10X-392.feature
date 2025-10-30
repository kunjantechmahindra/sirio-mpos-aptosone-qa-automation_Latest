@VFG10X-392 @StoreSelling @Regression
Feature: VFG10X-392 Store Selling Functions _ Item Discount validation after Price Override

  Scenario: Store Selling Functions _ Item Discount validation after Price Override

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #Discount at item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant enter discount percentage as 5
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "DAMAGED/DEFECT" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validate price of the item at index 1 after "5%" discount is applied

  #Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 100
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "RETURN/EXCHANGE" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validate price of the item at index 1 after "5%" discount is applied

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application



