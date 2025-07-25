@VFG10X-127 @StoreSelling @Regression

Feature: VFG10X-127 Sale and Return in same transaction

  Scenario: Sale and Return in same transaction

    #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return
    And the sales assistant clicks on Skip button

    #Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "CHANGED MIND" as reason code
    And the sales assistant navigate to basket page from return mode page

    #Add Product
    Then the sales assistant add 1 items from "General" product to the basket

  #Void Transaction
    And the sales assistant void the transaction from basket with reason code "Promo Error"
    And the sales assistant logout from the application

