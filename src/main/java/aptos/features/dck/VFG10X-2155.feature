@VFG10X-2155 @ReturnTransaction @Regression @PrerequisiteRequired

Feature: VFG10X-2155 Return Transaction _Perform as sale in one store and return in another state store

  Scenario: Return Transaction _Perform as sale in one store and return in another state store

    #Login and add an item
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    And the sales assistant clicks on return button
    And the sales assistant clicks on return search button

    #Add Sale Details
    And the sales assistant enters store number "300107" terminal "80" and transaction number "31"
    And the sales assistant return all items from the transaction
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





    