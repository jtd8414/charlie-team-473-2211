using Charlie.Monitor.Library.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Management;
using Serilog;

namespace Charlie.Monitor.Library.Utilities
{
    public interface IUserMonitorUtility
    {
        Task MonitorUsersAysnc(CancellationToken stoppingToken);
    }

    public class UserMonitorUtility : IUserMonitorUtility
    {
        private readonly IUserMonitorService _userMonitorService;
        private readonly ILogger _logger;
        
        public UserMonitorUtility(IUserMonitorService userMonitorService, ILogger logger)
        {
            _userMonitorService = userMonitorService;
            _logger = logger;
        }

        public async Task MonitorUsersAysnc(CancellationToken stoppingToken)
        {
            SelectQuery query = new("Win32_UserAccount");
            ManagementObjectSearcher searcher = new(query);
            foreach (ManagementObject envVar in searcher.Get())
            {
                _logger.Debug($"Found user {envVar["Name"]}");
            }
        }
    }
}
