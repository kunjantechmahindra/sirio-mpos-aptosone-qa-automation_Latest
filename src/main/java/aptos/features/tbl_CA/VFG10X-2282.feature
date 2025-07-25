@VFG10X-2282 @SaleTransaction @Regression @GiftCard @SmokeTBL
Feature: VFG10X-2282 Gift Card_Issue New GC by manually entering GC number

  Scenario: Gift Card_Issue New GC by manually entering GC number

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Issue New Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 2
    And the sales assistant enters gift card amount "500.00"
    And the sales assistant clicks on issue button
    And the sales assistant clicks on Skip button
    And the sales assistant lands on Basket Page

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
    And the sales assistant validate details "GIFT_CARD_ISSUE" in EJ
    And the sales assistant logout from EJViewer