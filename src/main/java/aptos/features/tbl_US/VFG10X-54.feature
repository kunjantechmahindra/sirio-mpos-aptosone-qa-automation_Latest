@VFG10X-54 @SaleTransaction @Regression

Feature: VFG10X-54 Sale Transaction _Non Merchandise Items_Shipping
  Scenario: Sale Transaction _Non Merchandise Items_Shipping

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Non Merch
    And the sales assistant clicks on Non-Merch button
    And the sales assistant select shipping
    And the sales assistant enter the shipping amount as 40
    And the sales assistant clicks on Apply button
    And the sales assistant clicks on Skip button
    And the sales assistant validate if "Shipping" is added to the basket at index 1

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Merchandise" in EJ
    And the sales assistant validate details "Shipping" in EJ
    And the sales assistant logout from EJViewer
