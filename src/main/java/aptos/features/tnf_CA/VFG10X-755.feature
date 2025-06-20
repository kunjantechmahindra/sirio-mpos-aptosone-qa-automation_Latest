@VFG10X-755 @SaleTransaction @Regression @GiftCard @Card
Feature: VFG10X-755 Gift Card _ New Gift Card issue by typing the Gift Card number

  Scenario: Gift Card _ New Gift Card issue by typing the Gift Card number

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Issue New Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 3
    And the sales assistant enters gift card amount "100.00"
    And the sales assistant clicks on issue button
    And the sales assistant clicks on Skip button
    And the sales assistant lands on Basket Page

  # Payment transaction
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

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer