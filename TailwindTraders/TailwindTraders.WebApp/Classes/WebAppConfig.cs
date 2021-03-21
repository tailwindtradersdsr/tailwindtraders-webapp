using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TailwindTraders.WebApp.Classes
{
    public static class WebAppConfig
    {
        public static string AppName { get; }

        static WebAppConfig() {
            AppName = "Tailwind Traders v3.0";
        }
    }
}
