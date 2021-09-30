using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Charlie.Monitor.Library.Models;
using Charlie.Monitor.Library.Services;
using Charlie.Monitor.Library.Utilities;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Serilog;
using Serilog.Core;

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
                    IConfigurationRoot configuration = new ConfigurationBuilder()
                        .AddJsonFile("appsettings.json", false, true)
                        .Build();

                    Logger logger = new LoggerConfiguration()
                        .ReadFrom.Configuration(configuration)
                        .CreateLogger();

                    ApplicationSettings applicationSettings =
                        configuration.GetSection(nameof(ApplicationSettings)).Get<ApplicationSettings>();
                    
                    services.AddHostedService<Worker>()
                        .AddTransient<IUserMonitorUtility, UserMonitorUtility>()
                        .AddTransient<IUserMonitorService, UserMonitorService>()
                        .AddSingleton<ILogger>(logger)
                        .AddSingleton(applicationSettings);
                    ;
                })
                .UseSerilog();
    }
}