@VFG10X-435 @PriceOverride @Regression

Feature: VFG10X-435 Price Override _Sale Transaction with Price override for Multiple items_ Reason code  RETURN/EXCHANGE (TBL) & On/Off Sale: Not Ringing TNF

  Scenario: Price Override _Sale Transaction with Price override for Multiple items_ Reason code  RETURN/EXCHANGE (TBL) & On/Off Sale: Not Ringing TNF

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 100
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "On/Off Sale: Not Ringing" as reason code
    And the sales assistant clicks on Apply button

   #Price override
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 100
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "On/Off Sale: Not Ringing" as reason code
    And the sales assistant clicks on Apply button

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "On/Off Sale: Not Ringing" in EJ
    And the sales assistant logout from EJViewer
