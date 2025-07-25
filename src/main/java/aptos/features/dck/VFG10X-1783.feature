@VFG10X-1783 @Regression @GiftCard @SmokeDCK
Feature: VFG10X-1783 Gift Card _Top up by manually entering the gift card Number

  Scenario: Gift Card _Top up by manually entering the gift card Number

  # Login to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Top-Up Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant clicks on existing gift card button
    And the sales assistant enters gift card number from index 1
    And the sales assistant enters gift card amount "100.00"
    And the sales assistant clicks on add value button

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "GIFT_CARD_RELOAD" in EJ
    And the sales assistant logout from EJViewer