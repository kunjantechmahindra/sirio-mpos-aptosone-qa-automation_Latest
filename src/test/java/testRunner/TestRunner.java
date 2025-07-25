package testRunner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)

@CucumberOptions(
        features = "src/main/java/aptos/features/tbl_CA",
        glue = {"aptos/stepDefinition","hooks"},
        monochrome = true,
        tags = "@Customer and not(@VFG10X-108 or @VFG10X-109 or @VFG10X-110 or @VFG10X-112 or @VFG10X-114 or @VFG10X-1720 or @VFG10X-113)",
        plugin = {"io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm"}
)

public class TestRunner {
}