@VFG10X-1049 @PromotionsAndDiscounts @Regression  @Rerun

Feature: VFG10X-971 Promotions and Discounts _ Item level Discount _Item discount in a sales transaction where 1st item Apply 71% OFF_Error_Apply 70% OFF,2nd Item 29$ OFF and apply Tax override on 1st item

  Scenario: Promotions and Discounts _ Item level Discount _Item discount in a sales transaction where 1st item Apply 71% OFF_Error_Apply 70% OFF,2nd Item 29$ OFF and apply Tax override on 1st item

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "HigherPrice" product to the basket without customer

    #Percentage Discount
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 71
    And the sales assistant validate error message for exceeding discount threshold value
    And the sales assistant reenter discount percentage as 70
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "DAMAGED/DEFECT" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Discount - 70%" is applied to item
    And the sales assistant lands on Basket Page

    #Discount at item level
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant enter discount amount as 29
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "DAMAGED/DEFECT" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "Discount ($29.00)" is applied to item
    And the sales assistant lands on Basket Page

    #Apply Tax override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 5
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - 5%" is applied to item
    And the sales assistant lands on Basket Page

    #Payment transaction
    And the sales assistant clicks on Pay button
    And  the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Item Tax Override" in EJ
    And the sales assistant validate details "Amount off" in EJ
    And the sales assistant validate details "Percent Off" in EJ
    And the sales assistant logout from EJViewer