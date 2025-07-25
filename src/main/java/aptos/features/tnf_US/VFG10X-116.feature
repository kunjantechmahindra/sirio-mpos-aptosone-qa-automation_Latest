@VFG10X-116 @Regression @GiftCard @SmokeTNF
Feature: VFG10X-116 Gift Card _Top up by manually entering the gift card Number_ Existing Customer

  Scenario: Gift Card _Top up by manually entering the gift card Number_ Existing Customer

  #Login to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 0

  #Top-Up Gift Card
    And the sales assistant validate if void button is enabled
    And the sales assistant clicks on gift card button
    And the sales assistant clicks on existing gift card button
    And the sales assistant enters gift card number from index 0
    And the sales assistant enters gift card amount "100.00"
    And the sales assistant clicks on add value button

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
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer


