@VFG10X-2213 @ExchangeTransaction @Regression

Feature: VFG10X-2213 Exchange_ Return with receipt of multiple items with employee discount _Single item sale

  Scenario: Exchange_ Return with receipt of multiple items with employee discount _Single item sale

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #Apply Employee Discount
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  #Payment transaction
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant lands on Basket Page

  #Add item
    Then the sales assistant add 1 items from "General" product to the basket

  #Apply Employee Discount
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
