@VFG10X-1238 @ReturnTransaction @Regression @GiftCard @Card
Feature: VFG10X-1238 Return transaction_ Return multiple items with Item level discount and Transactional discount and issue New Gift card as refund_Existing Customer assigned

  Scenario: Return transaction_ Return multiple items with Item level discount and Transactional discount and issue New Gift card as refund_Existing Customer assigned

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "HigherPrice" product to the basket without customer

  #Discount at item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant enter discount amount as 50
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Discount ($50.00)" is applied to item

  #Add transaction level discount
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 0

#Return transaction
    And the sales assistant validate if void button is enabled
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant selects the return product at index 2
    And the sales assistant clicks on Done button
    And the sales assistant selects "RTL - Worn/Performance" as reason code
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant selects the return product at index 1
    And the sales assistant clicks on Done button
    And the sales assistant selects "ECOM - Worn/Performance" as reason code

    #Refund to gift card
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 2
    And the sales assistant clicks on issue button from payment page
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "RTL - Worn/Performance" in EJ
    And the sales assistant validate details "ECOM - Worn/Performance" in EJ
    And the sales assistant logout from EJViewer
    #
