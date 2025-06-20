@VFG10X-2217 @Regression @GiftCard
Feature: VFG10X-2217 Gift Card_ Tender Exchange by manually typing the gift card with PIN

  Scenario: Gift Card_ Tender Exchange by manually typing the gift card with PIN

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Tender exchange
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on Tender exchange button
    And the sales assistant enters gift card number from index 0
    And the sales assistant clicks on continue button to exchange
    And the sales assistant enter the the pin from index 0
    And the sales assistant clicks on Cash for Exchange
    And the sales assistant enter the the pin from index 0
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

