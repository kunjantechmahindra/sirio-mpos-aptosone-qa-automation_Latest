@VFG10X-52 @SaleTransaction @Regression
Feature: VFG10X-52 Sale Transaction _ Multiple Items with Transactional discount _Suspend transaction

  Scenario: Sale Transaction _ Multiple Items with Transactional discount _Suspend transaction

    # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    # Discount at transaction level
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 6
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "E-MAIL" as reason code
    And the sales assistant clicks on Apply button

    # Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant clicks on Basket button from header

    # Suspend Transaction
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate details "Transaction suspended" in EJ
    And the sales assistant logout from EJViewer

