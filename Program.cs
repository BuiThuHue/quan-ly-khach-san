using Microsoft.EntityFrameworkCore;
using QLHotel.Models;
using Rotativa.AspNetCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews();

builder.Services.AddDbContext<QuanLyKhachSanContext>(options =>
    options.UseMySql(
        builder.Configuration.GetConnectionString("MyConnection"),
        ServerVersion.AutoDetect(
            builder.Configuration.GetConnectionString("MyConnection")
        )
    ));

builder.Services.AddSession();

var app = builder.Build();

RotativaConfiguration.Setup(
    app.Environment.WebRootPath,
    "Rotativa"
);

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.UseSession();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();