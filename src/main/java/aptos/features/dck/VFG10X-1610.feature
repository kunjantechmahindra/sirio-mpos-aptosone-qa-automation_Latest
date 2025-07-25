@VFG10X-1610 @SaleTransaction @Regression
Feature: VFG10X-1610 Sale Transaction with Price Override - 3 Items

  Scenario: Sale Transaction with Price Override - 3 Items

    # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 3 items from "General" product to the basket

    # Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Incorrect PLU Price" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "$10.00" is applied to item


    # Price override
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 8
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Incorrect Ticket" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "$8.00" is applied to item


    # Price override
    And the sales assistant selects the product at index 3
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 9
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Incorrect PLU Price" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 3
    And the sales assistant validate "$9.00" is applied to item

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application








