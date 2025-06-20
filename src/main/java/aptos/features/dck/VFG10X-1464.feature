@VFG10X-1464 @Regression @GiftCard @SmokeDCK
Feature: VFG10X-1464 Gift Card - Tender Exchange

  Scenario: Gift Card - Tender Exchange

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Tender exchange
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on Tender exchange button
    And the sales assistant enters gift card number from index 2
    And the sales assistant clicks on continue button to exchange
    And the sales assistant enter the the pin from index 2
    And the sales assistant clicks on Cash for Exchange
    And the sales assistant enter the the pin from index 2
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application