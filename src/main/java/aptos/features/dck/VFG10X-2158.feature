@VFG10X-2158 @ExchangeTransaction @Regression
Feature: VFG10X-2158 DCK - Exchange transaction of quantity updated items with sale of quantity updated apply Tax override

  Scenario: DCK - Exchange transaction of quantity updated items with sale of quantity updated apply Tax override

  # Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

  # Change Quantity
    And the sales assistant selects the product at index 1
    And the sales assistant selects the Change Quantity button
    And the sales assistant enters "2" as the quantity
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

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
    And the sales assistant selects "Changed Mind" as reason code
    And the sales assistant lands on Basket Page
    And the sales assistant add same items to the basket

  # Apply Tax override
    And the sales assistant selects the product at index 3
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant clicks on amount button for tax override
    And the sales assistant enter new tax amount as 3
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 3
    And the sales assistant validate "Tax override - $3.00" is applied to item

  # Change Quantity
    And the sales assistant selects the product at index 3
    And the sales assistant selects the Change Quantity button
    And the sales assistant enters "2" as the quantity
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application