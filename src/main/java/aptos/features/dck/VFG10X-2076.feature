@VFG10X-2076 @StoreSelling @Regression

Feature: VFG10X-2076 Store Selling Functions_ Availability of Receipt slip for No Sale

  Scenario: Store Selling Functions_ Availability of Receipt slip for No Sale

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #No sale
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on No sale
    And the sales assistant enter the Drawer ID
    #And the sales assistant clicks on reason code button
    #And the sales assistant selects "Correct Change" as reason code
    And the sales assistant clicks on proceed button
    And the sales assistant select the printer

    #Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate details "Sent" in EJ
    And the sales assistant logout from EJViewer