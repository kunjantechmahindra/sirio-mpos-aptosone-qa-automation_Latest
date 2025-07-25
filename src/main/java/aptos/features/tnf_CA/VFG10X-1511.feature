@VFG10X-1511 @ReturnTransaction @Regression @PrerequisiteRequired
Feature: VFG10X-1511 Return Transaction_Not able to return items above 30 days

  Scenario: Return Transaction_Not able to return items above 30 days

    #Login and add item to basket
    Given the sales assistant logs in to the application with "below" security level
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant clicks on return search button
    And  the sales assistant enters store number "101214" terminal "77" and transaction number "329"
    And the sales assistant clicks on continue button
    And the manager approves the action
    And the sales assistant return all items from the transaction
    #And the manager approves the action
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


