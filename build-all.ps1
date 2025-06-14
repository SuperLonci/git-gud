# Build git-gud for Windows, macOS, and Linux
$outputDir = "build"
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

Write-Host "🔨 Building binaries..."

# Build for Windows
$env:GOOS = "windows"
$env:GOARCH = "amd64"
go build -o "$outputDir/git-gud-windows.exe"
Write-Host "✅ Built git-gud-windows.exe"

# Build for macOS (Apple Silicon)
$env:GOOS = "darwin"
$env:GOARCH = "arm64"
go build -o "$outputDir/git-gud-macos-arm64"
Write-Host "✅ Built git-gud-macos-arm64"

# Build for Linux
$env:GOOS = "linux"
$env:GOARCH = "amd64"
go build -o "$outputDir/git-gud-linux"
Write-Host "✅ Built git-gud-linux"

# Clean up env vars
Remove-Item Env:GOOS
Remove-Item Env:GOARCH

Write-Host "`n📦 Zipping binaries..."

# Zip each binary individually
Compress-Archive -Path "$outputDir/git-gud-windows.exe" -DestinationPath "$outputDir/git-gud-windows.zip"
Compress-Archive -Path "$outputDir/git-gud-macos-arm64"   -DestinationPath "$outputDir/git-gud-macos-arm64.zip"
Compress-Archive -Path "$outputDir/git-gud-linux"          -DestinationPath "$outputDir/git-gud-linux.zip"

Write-Host "🎉 All done! Zipped binaries saved in: $outputDir"
