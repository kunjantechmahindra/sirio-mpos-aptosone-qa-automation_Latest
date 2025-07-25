@VFG10X-1480 @CashManagement @Regression

  Feature: VFG10X-1480 DCK - Cash Management_Till to Safe_Dickies

    Scenario: DCK - Cash Management_Till to Safe_Dickies

  #Login and add item to basket
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button

  #Till to safe Store Operations
      And the sales assistant navigate to store operations page
      And the sales assistant clicks on "Till operations" for cash management
      And the sales assistant clicks on "Till to safe" for cash management
      And the sales assistant enter the Drawer ID
      And the sales assistant enter the amount
      And the sales assistant enters the quantity as 100 on first index
      And the sales assistant clicks on proceed button
      And the sales assistant clicks on proceed button
      And the sales assistant select the printer
      And the sales assistant logout from the application

