@VFG10X-957 @ExchangeTransaction @Regression
Feature: VFG10X-957 Exchange _Multiple items with Tax Override, and Tax Exempt

  Scenario: Exchange _Multiple items with Tax Override, and Tax Exempt

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant lands on Basket Page

    #Add product
    Then the sales assistant add 2 items from "HigherPrice" product to the basket

    #Apply Tax override
    And the sales assistant selects the product at index 3
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 5
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 3
    And the sales assistant validate "Tax override - 5%" is applied to item
    And the sales assistant lands on Basket Page

    #Tax exempt item level
    And the sales assistant selects the product at index 4
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Select a reason code button on tax exempt page
    And the sales assistant clicks on reason code as tax exempt
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 4
    And the sales assistant validate "Tax exempt - HST Tax" is applied to item

    #Payment transaction
    And the sales assistant clicks on Pay button
    And  the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Changed Mind" in EJ
    And the sales assistant validate details "Item Tax Override" in EJ
    And the sales assistant validate details "Item tax exempt" in EJ
    And the sales assistant logout from EJViewer