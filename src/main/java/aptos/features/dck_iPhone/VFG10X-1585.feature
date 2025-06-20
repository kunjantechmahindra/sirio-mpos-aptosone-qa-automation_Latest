@VFG10X-1585 @CashManagement @Regression

  Feature: VFG10X-1585 DCK - iPhone - Cash Management with Till In Transactions

    Scenario: DCK - iPhone - Cash Management with Till In Transactions

  #Login and add item to basket
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button

  #Store Operations Void Till in
      And the sales assistant navigate to store operations page
      And the sales assistant clicks on "Till operations" for cash management
      And the sales assistant clicks on "Till in" for cash management
      And the sales assistant enter the Drawer ID
      And the sales assistant clicks on counted amount for till in
      And the sales assistant enters the quantity as 100 on first index
      And the sales assistant assign click on done
      And the sales assistant clicks on proceed button
      And the sales assistant clicks on proceed button
      And the sales assistant clicks on proceed button from variance in amount
      And the sales assistant clicks on proceed button
      And the sales assistant clicks on GO to basket button
      And the sales assistant logout from the application