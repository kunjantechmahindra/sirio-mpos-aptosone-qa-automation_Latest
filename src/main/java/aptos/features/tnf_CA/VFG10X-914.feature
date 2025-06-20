@VFG10X-914 @CashManagement @Regression
Feature: VFG10X-914 Cash Management _PAID IN _ TNF Reason Code validation_Alphabetic order

  Scenario: Cash Management _PAID IN _ TNF Reason Code validation_Alphabetic order

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # PAID OUT Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Paid in" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant assign enter the amount 10
    And the sales assistant clicks on Select a reason code for cash management
    And the sales assistant validate if reason code is displayed in alphabetic order for Paid In
#    And the sales assistant validate if reason code is displayed in alphabetic order
    And the sales assistant selects "Holiday Meal" as reason code
    And the sales assistant clicks on proceed button
    And the sales assistant sign for the transaction
    And the sales assistant select the printer
    And the sales assistant logout from the application