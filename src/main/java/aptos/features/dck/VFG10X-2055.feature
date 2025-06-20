@VFG10X-2055  @StoreSelling @Regression @SmokeDCK
Feature: VFG10X-2055 Store Selling Functions _Validate receipt reprint times

  Scenario: Store Selling Functions _Validate receipt reprint times

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Add Product
    Then the sales assistant add 1 items from "General" product to the basket

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer

    #Reprint validation
    And the sales assistant navigate to Sales history page
    And the sales assistant search a transaction from Sales history page
    And the sales assistant clicks on Reprint button
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant navigate to Sales history page
    And the sales assistant search a transaction from Sales history page
    And the sales assistant clicks on Reprint button
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant navigate to Sales history page
    And the sales assistant search a transaction from Sales history page
    And the sales assistant clicks on Reprint button
    And the sales assistant validate the reprint option is only available twice
    And the sales assistant navigate to basket page from Sales details page
    And the sales assistant logout from the application