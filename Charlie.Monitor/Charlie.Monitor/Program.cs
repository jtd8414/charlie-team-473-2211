using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Charlie.Monitor.Library.Services;
using Charlie.Monitor.Library.Utilities;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Charlie.Monitor
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureServices((hostContext, services) => { 
                    services.AddHostedService<Worker>()
                        .AddTransient<IUserMonitorUtility, UserMonitorUtility>()
                        .AddTransient<IUserMonitorService, UserMonitorService>()
                    ;
                });
    }
}