using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Charlie.Monitor.Library.Utilities;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Charlie.Monitor
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;
        private readonly IUserMonitorUtility _userMonitorUtility;

        public Worker(ILogger<Worker> logger, IUserMonitorUtility userMonitorUtility)
        {
            _logger = logger;
            _userMonitorUtility = userMonitorUtility;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                _logger.LogInformation("Worker running at: {time}", DateTimeOffset.Now);
                await _userMonitorUtility.MonitorUsersAysnc(stoppingToken);
                await Task.Delay(5000, stoppingToken);
            }
        }
    }
}