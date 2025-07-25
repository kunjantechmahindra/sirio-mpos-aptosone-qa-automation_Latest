@VFG10X-1645 @SFCC @PrerequisiteRequired

Feature: VFG10X-1645 SFCC_Update in BOGO Promotion validation in Aptos ONE
  Scenario: SFCC_Update in BOGO Promotion validation in Aptos ONE

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Add item to the basket
    And the sales assistant enters 2 "BOGO-sfcc" item UPC manually in the basket without customer
    And the sales assistant lands on Basket Page

  #Validate promotion is applied to the product
   And the sales assistant selects the product at index 1
   And the sales assistant validate "BOGOF" is applied to item
   And the sales assistant selects the product at index 2
   And the sales assistant validate "BOGOF" is applied to item
   And the sales assistant void the transaction from basket with reason code "Cashier Error"
   And the sales assistant logout from the application
