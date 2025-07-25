@VFG10X-1741 @SaleTransaction @Regression

Feature: VFG10X-1741 Validation of e-receipt header and footer

  Scenario: Validation of e-receipt header and footer

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Retrieve date of transaction from Aptos
    And the sales assistant navigate to information page
    And the sales save the transaction date and address
    And the sales assistant navigate to basket page

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application

  #E-receipt validation
    Given the sales assistant launch the browser and navigate to YOP mail
    And the sales assistant validate e-receipt header and footer
    And the sales assistant closes the browser window.