using FeiraApi.Dominio;
using FeiraAPI.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using Microsoft.OpenApi.Models;

namespace FeiraAPI {
    public class Startup {
        public Startup(IConfiguration configuration) {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services) {

            //configuração do mongodb
            services.Configure<FeiraApiStoreDatabaseSettings>(
                Configuration.GetSection(nameof(FeiraApiStoreDatabaseSettings)));
            //configuração do mongodb
            services.AddSingleton<IFeiraApiStoreDatabaseSettings>(sp =>
                sp.GetRequiredService<IOptions<FeiraApiStoreDatabaseSettings>>().Value);

            services.AddSingleton<FeiraService>();
            services.AddSingleton<PerfilService>();

            services.AddControllers();

            ConfigureSwagger(services);
        }

        private static void ConfigureSwagger(IServiceCollection services) {
            services.AddSwaggerGen(options => {
                options.SwaggerDoc("v1",
                    new OpenApiInfo
                    {
                        Title = "Projeto Feira - Lucas Veríssimo",
                        Version = "v1",
                        Description = "API para transição de dados para o aplicativo."
                    });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();
            app.UseSwaggerUI(c => {
                c.RoutePrefix = string.Empty;
                c.SwaggerEndpoint("./swagger/v1/swagger.json", "FeiraApi");
            });

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints => {
                endpoints.MapControllers();
            });
        }
    }
}
