package testRunner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)

@CucumberOptions(
        features = "src/main/java/aptos/features/tbl_US",
        glue = {"aptos/stepDefinition","hooks"},
        monochrome = true,
        tags = "@Omni_Payments_Check or @Carry_Out_Payments_Check",
        plugin = {"io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm"}
)

public class TestRunner {
}