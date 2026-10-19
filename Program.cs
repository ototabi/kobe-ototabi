var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

// 💡 画面を動かすために、ここを一番確実でエラーの出ない標準の書き方に直しました！
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

// 💡 ここも一番シンプルでエラーの起きない標準的なルーティングに書き換えました！
app.MapRazorPages();

app.Run();
