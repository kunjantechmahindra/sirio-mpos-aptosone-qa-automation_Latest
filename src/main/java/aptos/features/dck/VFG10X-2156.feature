@VFG10X-2156 @ReturnTransaction @Regression @PrerequisiteRequired

Feature: VFG10X-2156 Return Transaction _Perform a verified return of a sale transaction that has exceeded the return period _below security level 30

  Scenario: Return Transaction _Perform a verified return of a sale transaction that has exceeded the return period _below security level 30

    #Login
    Given the sales assistant logs in to the application with "below" security level
    When the sales assistant clicks on Start Basket button
    And the sales assistant clicks on return button
    And the sales assistant clicks on return search button

    #Add Sale Details
    And the sales assistant enters store number "300106" terminal "75" and transaction number "1812"
    And the sales assistant validate the returnable period expired message
    And sales assistant give manager approval
    And the sales assistant return all items from the transaction
    And sales assistant give manager approval
    And the sales assistant selects "Changed Mind" as reason code
    And the sales assistant lands on Basket Page

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application





    