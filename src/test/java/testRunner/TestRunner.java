package testRunner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)

@CucumberOptions(
        features = "src/main/java/aptos/features/tbl_US",
        glue = {"aptos/stepDefinition","hooks"},
        monochrome = true,
        tags = "@VFG10X-1157 or @VFG10X-1155 or @VFG10X-2265",
                //" and not (@PrerequisiteRequired or @SmokeTNF or @Card or @Visa or @GiftCard)",
        plugin = {"io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm"}
)

public class TestRunner {
}