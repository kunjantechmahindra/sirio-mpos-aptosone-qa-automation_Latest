@VFG10X-1704 @ReturnTransaction @Regression @DetailedCalculation

Feature: VFG10X-1704 Exchange Transaction_Exchange multi-items, Sale 1st item with Price-Override and Return 2nd item with 15 %Tax-Override with Receipt

  Scenario: Exchange Transaction_Exchange multi-items, Sale 1st item with Price-Override and Return 2nd item with 15 %Tax-Override with Receipt

  # Login and Add Product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  # Apply Tax override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 15
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - 15%" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant validate "15%" tax override to the item at index 1
    And the sales assistant validate total transaction amount

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code

  # Add item to basket
    Then the sales assistant add 1 items from "General" product to the basket

  # Price override
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 30
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validate the price of the product is 30 at index 2
    And the sales assistant validate total transaction amount

  # Complete refund
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application