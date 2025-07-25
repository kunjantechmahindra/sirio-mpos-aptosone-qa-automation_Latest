@VFG10X-117 @Regression @GiftCard @SmokeTNF
Feature: VFG10X-117 Gift Card_ Tender Exchange by manually typing the gift card with PIN

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

  #Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate details "Gift Card" in EJ
    And the sales assistant validate details "Cash" in EJ
    And the sales assistant logout from EJViewer
