package Utilities;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.Test;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import cucumber.api.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

@KarateOptions(tags = { "@createUser,@serachUser,@updateUser,@userLogin,@deleteUser" })

public class TestRunner {
	@Test
	public void testParallel() {
		Results results = Runner.parallel(getClass(), 5, "E:\\java neon workspace\\petShop\\target");
	}
}
