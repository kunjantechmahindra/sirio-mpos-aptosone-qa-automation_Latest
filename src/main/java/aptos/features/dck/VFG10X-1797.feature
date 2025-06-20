@VFG10X-1797 @ExchangeTransaction @Regression
Feature: VFG10X-1797 Return Transaction _Blind return_Single temp MD item with payment by Gift Card _Refund to Gift card

  Scenario: Return Transaction _Blind return_Single temp MD item with payment by Gift Card _Refund to Gift card

#Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

    #Add Product
    Then the sales assistant add an items from "Temp-MD" product for return
    And the sales assistant selects "Changed Mind" as reason code
    And the sales assistant navigate to basket page from return mode page

    #Apply Tax override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 5
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - 5%" is applied to item
    And the sales assistant lands on Basket Page

    #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant clicks on existing gift card button
    And the sales assistant enter the gift card number for payment from index 1
    And the sales assistant clicks on add value button from payment page
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer