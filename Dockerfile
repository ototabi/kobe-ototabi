FROM ://microsoft.com AS build
WORKDIR /src
COPY ["kobe-ototabi.csproj", "."]
RUN dotnet restore "kobe-ototabi.csproj"
COPY . .
RUN dotnet publish "kobe-ototabi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM ://microsoft.com AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "kobe-ototabi.dll"]
