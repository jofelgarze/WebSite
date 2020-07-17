using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebSiteLogin.Startup))]
namespace WebSiteLogin
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
