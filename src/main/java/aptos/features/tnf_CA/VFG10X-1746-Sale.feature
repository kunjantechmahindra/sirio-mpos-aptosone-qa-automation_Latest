@VFG10X-1746 @SaleTransaction @Regression @OfflineSale
Feature: VFG10X-1746 Return Transaction _ Return a Sale Transaction created on offline mode
  #Make sale is offline mode

  Scenario: Return Transaction _ Return a Sale Transaction created on offline mode

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Add Product
    Then the sales assistant add 1 items from "General" product to the basket without customer

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return
    And the sales assistant logout from the application