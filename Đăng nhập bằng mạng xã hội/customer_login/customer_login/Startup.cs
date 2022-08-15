using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(customer_login.Startup))]
namespace customer_login
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
