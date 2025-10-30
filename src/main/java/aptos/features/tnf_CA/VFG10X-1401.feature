@VFG10X-1401 @Regression @StoreSelling
Feature: VFG10X-1401 Store Selling Functions _Validation of if store-copy receipt slip be printed when a Return is performed

  Scenario: Store Selling Functions _Validation of if store-copy receipt slip be printed when a Return is performed

   #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

    #Payment
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
    And the sales assistant selects "Changed Mind" as reason code

    #Get store details from information page
    And the sales assistant navigate to information page
    And the sales assistant save the store details from information page
    And the sales assistant clicks on Basket button from header

    #Refund by cash
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant validates the store copy receipt is printed
    #sometimes it will show api issues like "couldn't open web cam"
    And the sales assistant logout from the application