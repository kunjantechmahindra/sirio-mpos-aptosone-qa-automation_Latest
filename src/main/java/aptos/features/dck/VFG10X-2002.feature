@VFG10X-2002 @ReturnTransaction @Regression
Feature: VFG10X-2002 Return transaction with multiple items with Tax Override by amount , and Tax Exempt, Get E-Receipt

  Scenario: Return transaction with multiple items with Tax Override by amount , and Tax Exempt, Get E-Receipt

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

    #Apply Tax override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant clicks on amount button for tax override
    And the sales assistant enter new tax amount as 2
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - $2.00" is applied to item


  # Apply Tax exempt
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "Tax exempt - Sales Tax" is applied to item

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Changed Mind" as reason code
    And the sales assistant lands on Basket Page

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant select the printer
    And the sales assistant logout from the application
