# Define build output folder
$outputDir = "build"
Remove-Item -Recurse -Force $outputDir -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

# Build targets
$targets = @(
    @{ GOOS = "windows"; GOARCH = "amd64"; OUT = "git-gud-windows.exe" },
    @{ GOOS = "darwin";  GOARCH = "arm64";  OUT = "git-gud-macos-arm64" },
    @{ GOOS = "darwin";  GOARCH = "amd64";  OUT = "git-gud-macos-amd64" },
    @{ GOOS = "linux";   GOARCH = "amd64";  OUT = "git-gud-linux" }
)

# Loop through targets
foreach ($target in $targets) {
    $env:GOOS = $target.GOOS
    $env:GOARCH = $target.GOARCH
    $outputFile = Join-Path $outputDir $target.OUT

    Write-Host "Building for $env:GOOS/$env:GOARCH -> $($target.OUT)"

    go build -o $outputFile main.go

    if (!(Test-Path $outputFile)) {
        Write-Error "Build failed: $outputFile was not created."
        exit 1
    }

    Write-Host "Built $($target.OUT)"
}

# Clean up Go env
Remove-Item Env:GOOS
Remove-Item Env:GOARCH

# Zip binaries
# Write-Host ""
# Write-Host "Zipping binaries..."

# Get-ChildItem $outputDir -File | ForEach-Object {
#     $zipPath = "$($_.FullName).zip"
#     Compress-Archive -Path $_.FullName -DestinationPath $zipPath -Force
#     Write-Host "Created $zipPath"
# }

Write-Host ""
Write-Host "All builds completed successfully!"
