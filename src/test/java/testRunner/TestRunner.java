package testRunner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)

@CucumberOptions(
        features = "src/main/java/aptos/features/tbl_CA",
        glue = {"aptos/stepDefinition","hooks"},
        monochrome = true,
        //tags = "@ReturnTransaction and  @Card and (@Master or @Visa or @Amex or @VisaMaster) and not @GiftCard and not @PrerequisiteRequired",
        tags = "@Customer",
        plugin = {"io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm"}
)

public class TestRunner {
}