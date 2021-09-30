using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Charlie.Monitor.Library.Models;
using Charlie.Monitor.Library.Utilities;
using Microsoft.Extensions.Hosting;
using Serilog;

namespace Charlie.Monitor
{
    public class Worker : BackgroundService
    {
        private readonly ILogger _logger;
        private readonly IUserMonitorUtility _userMonitorUtility;
        private readonly ApplicationSettings _applicationSettings;

        public Worker(ILogger logger, IUserMonitorUtility userMonitorUtility, ApplicationSettings applicationSettings)
        {
            _logger = logger;
            _userMonitorUtility = userMonitorUtility;
            _applicationSettings = applicationSettings;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                _logger.Debug("{appName} running at: {time}", _applicationSettings.ApplicationName, DateTimeOffset.Now);
                await _userMonitorUtility.MonitorUsersAysnc(stoppingToken);
                await Task.Delay(5000, stoppingToken);
            }
        }
    }
}