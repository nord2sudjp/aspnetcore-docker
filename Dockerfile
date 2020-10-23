FROM mcr.microsoft.com/dotnet/core/sdk AS build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release
FROM mcr.microsoft.com/dotnet/core/aspnet
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet","AspNetCoreOnDocker.dll"]