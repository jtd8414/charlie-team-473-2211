using Charlie.Monitor.Library.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Management;

namespace Charlie.Monitor.Library.Utilities
{
    public interface IUserMonitorUtility
    {
        Task MonitorUsersAysnc(CancellationToken stoppingToken);
    }

    public class UserMonitorUtility : IUserMonitorUtility
    {
        private readonly IUserMonitorService _userMonitorService;

        public UserMonitorUtility(IUserMonitorService userMonitorService)
        {
            _userMonitorService = userMonitorService;
        }

        public async Task MonitorUsersAysnc(CancellationToken stoppingToken)
        {
            SelectQuery query = new("Win32_UserAccount");
            ManagementObjectSearcher searcher = new(query);
            foreach (ManagementObject envVar in searcher.Get())
            {
                Console.WriteLine("Username : {0}", envVar["Name"]);
            }
        }
    }
}
