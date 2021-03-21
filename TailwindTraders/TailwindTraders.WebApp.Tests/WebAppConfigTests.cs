using Microsoft.VisualStudio.TestTools.UnitTesting;
using TailwindTraders.WebApp.Classes;

namespace WebAppTests
{
    [TestClass]
    public class WebAppConfigTests
    {
        [TestMethod]
        public void WebAppConfig_AppName_IsCorrect()
        {
            string expected = "Tailwind Traders v1.0";
            // Assert
            Assert.AreEqual(expected, TailwindTraders.WebApp.Classes.WebAppConfig.AppName, "Web app configuration AppName is not correct.");
        }
    }
}