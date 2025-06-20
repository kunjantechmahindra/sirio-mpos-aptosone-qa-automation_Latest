@VFG10X-1640 @SFCC @PrerequisiteRequired

Feature: VFG10X-1640 SFCC_ Update a Dickies BOGO promotion

  Scenario: SFCC_ Update a Dickies BOGO promotion

    # Login
    Given the sales assistant launches SFCC application
    And the sales assistant login to SFCC application
    And the sales assistant selects "Dickies POS" as site
    And the sales assistant selects campaigns from merchant tools
    And the sales assistant enter the promotion ID "202408291"
    And the sales assistant select start date "11-Jan-2024"
    And the sales assistant select end date "19-Jan-2025"
    And sales assistant clicks on apply button in campaign page
    And sales assistant selects promotions from merchant tools
    And sales assistant enter the promotion ID "202408291" for promotions
    And sales assistant update the UPC's for the promotion
    And sales assistant select the SKU for "BOGO-category"
    And sales assistant clicks on Apply button in promotion page
    And sales assistant clicks on Jobs from administration tab
    And sales assistant clicks on export promotion JSON for "Dickies"
    And sales assistant clicks on Schedule and History Tab
    And sales assistant clicks on run button
    And sales assistant quit the browser