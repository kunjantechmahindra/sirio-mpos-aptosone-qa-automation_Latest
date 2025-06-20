@VFG10X-2219 @ReturnTransaction @Regression @GiftCard
Feature: VFG10X-2219 Return Transaction _Single item with tax override with payment by Gift Card _Refund to Gift card _No Customers

  Scenario: Return Transaction _Single item with tax override with payment by Gift Card _Refund to Gift card _No Customers

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Add Product
    Then the sales assistant add 1 items from "General" product to the basket without customer

    #Apply Tax override
    When the sales assistant selects the product at index 1
    And the sales assistant clicks on "Tax" button from basket
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant clicks on amount button for tax override
    And the sales assistant enter new tax amount as 7
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - $7.00" is applied to item
    And the sales assistant lands on Basket Page

    #Payment transaction
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 3
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 3
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code

    #Refund to gift card
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant clicks on existing gift card button
    And the sales assistant enter the gift card number for payment from index 3
    And the sales assistant clicks on add value button from payment page
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
