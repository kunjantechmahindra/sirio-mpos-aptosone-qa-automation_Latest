@VFG10X-286 @Regression @ExchangeTransaction
Feature: VFG10X-286 Exchange _Price Override on the return item _Return using Customer search _ECOMM Created customer

  Scenario:  Exchange _Price Override on the return item _Return using Customer search _ECOMM Created customer

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 8

    #Add Product
    Then the sales assistant add 1 items from "LowerPrice" product to the basket

    #Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Incorrect Price" as reason code
    And the sales assistant clicks on Apply button

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant clicks on customer search button
    And the sales assistant search a customer using email at index 8
#    And the sales assistant assign customer on the return customer search
    And the sales assistant select the transaction to be returned
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant clicks on "Ok" button to assign customer

    #Add Product
    And the sales assistant lands on Basket Page
    Then the sales assistant add 1 items from "HigherPrice" product to the basket
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant clicks on Basket button from header

    #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "RTL - Changed Mind" in EJ
    And the sales assistant logout from EJViewer