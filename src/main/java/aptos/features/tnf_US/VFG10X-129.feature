@VFG10X-129 @StoreSelling @Regression
Feature: VFG10X-129 Store Selling Functions_ Availability of Receipt slip for No Sale

  Scenario: Store Selling Functions_ Availability of Receipt slip for No Sale

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #No sale
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on No sale
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on reason code button
    And the sales assistant selects "Correct Change" as reason code
    And the sales assistant clicks on proceed button
    And the sales assistant select the printer
    And the sales assistant logout from the application
