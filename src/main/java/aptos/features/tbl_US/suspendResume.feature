 @de @resume
Feature:  Suspend resume

  Scenario: Suspend and Resume

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #Suspend and Resume Transaction
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant clicks on Resume button
    And the sales assistant navigate to basket page
    And the sales assistant clicks on Resume button
    And the sales assistant select the transaction to be resumed
    And the sales assistant proceed without selecting the customer
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application
