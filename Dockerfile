from mcr.microsoft.com/dotnet/core/aspnet AS build
workdir /code
copy ..
run dotnet restore
run dotnet publish -- out /output -- configration Release
from microsoft/aspnetcore
copy -- from=build /output /app
workdir /app 
"dotnet", "ASPCoreDockerDemo"
