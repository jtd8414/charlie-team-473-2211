using System.Collections.Generic;

namespace Charlie.Monitor.Library.Models
{
    public class ApplicationSettings
    {
        public string ApplicationName { get; set; }
        public List<string> AuthorizedUsers { get; set; }
    }
}