@VFG10X-1746 @ReturnTransaction @Regression @OnlineReturn @PrerequisiteRequired
Feature: VFG10X-1746 Return Transaction _ Return a Sale Transaction created on offline mode

  Scenario: Return Transaction _ Return a Sale Transaction created on offline mode

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant clicks on return search button
    And  the sales assistant enters store number "400528" terminal "40" and transaction number "1746"
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Damaged/Defective" as reason code

  #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
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
    And the sales assistant logout from EJViewer


