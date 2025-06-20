@VFG10X-68 @SaleTransaction @Regression @Card
Feature: VFG10X-68 Sale Transaction _Single Item_ Card decline and payment completed by cash with change

  Scenario: Sale Transaction _Single Item_ Card decline and payment completed by cash with change

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button

    # Need to write script for clicking decline button in PED using Robotic Action

    And the sales assistant clicks on Close button from payment page
    And the sales assistant enter extra amount
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant validate change due amount
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer