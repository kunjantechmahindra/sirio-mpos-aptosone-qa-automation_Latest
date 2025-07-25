@VFG10X-989 @Customer @Regression
Feature: VFG10X-989 _Removing customer from Return

  Scenario: Customer _Removing customer from Return

 #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

 #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

 #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

 #Return transaction
    And the sales assistant validate if void button is enabled
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code

 #Remove the customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant removes the customer from the transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
