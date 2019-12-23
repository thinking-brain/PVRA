using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PVRA.Startup))]
namespace PVRA
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
