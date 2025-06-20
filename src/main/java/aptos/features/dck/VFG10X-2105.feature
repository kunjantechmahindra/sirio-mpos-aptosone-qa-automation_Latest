@VFG10X-2105 @Regression @StoreSelling
Feature: VFG10X-2105 Store Selling Functions _Validation of the possibility to modify the reason code for a returned item, once selected

  Scenario: Store Selling Functions _Validation of the possibility to modify the reason code for a returned item, once selected

   #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

 #Add Product
    Then the sales assistant add 2 items from "General" product to the basket

 #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

 #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Changed Mind" as reason code

  #Change Reason Code
    And the sales assistant selects the product at index 1
    And the sales assistant select return reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Damaged" is applied to item

  #Void and Logout from the application
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application
