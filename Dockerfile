# 💡 パズルみたいに英語をバラバラにして繋ぎ合わせる魔法のコードです
ARG REGISTRY=mcr.microsoft.com

FROM ${REGISTRY}/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o /app/publish

FROM ${REGISTRY}/dotnet/aspnet:9.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "kobe-ototabi.dll"]
