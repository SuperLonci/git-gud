#!/usr/bin/env zsh

# Define build output folder
outputDir="build"
rm -rf $outputDir
mkdir -p $outputDir

# Build targets
targets=(
    "windows:amd64:git-gud-windows.exe"
    "darwin:arm64:git-gud-macos-arm64"
    "darwin:amd64:git-gud-macos-amd64"
    "linux:amd64:git-gud-linux"
)

# Track success status
success=true

# Loop through targets
for target in "${targets[@]}"; do
    # Split the target string properly using IFS
    IFS=":" read -r GOOS GOARCH OUT <<< "$target"
    
    outputFile="$outputDir/$OUT"
    
    echo "Building for $GOOS/$GOARCH -> $OUT"
    
    # Set environment variables and build
    GOOS=$GOOS GOARCH=$GOARCH go build -o "$outputFile" main.go
    
    # Check if build succeeded
    if [[ ! -f "$outputFile" ]]; then
        echo "Error: Build failed: $outputFile was not created." >&2
        success=false
        continue
    fi
    
    echo "Built $OUT"
    
    # Calculate and display SHA-256 hash
    if [[ "$(uname)" == "Darwin" ]]; then
        # macOS uses different shasum syntax
        hash=$(shasum -a 256 "$outputFile" | awk '{print $1}')
    else
        # Linux/other systems
        hash=$(sha256sum "$outputFile" | awk '{print $1}')
    fi
    
    echo "SHA-256: $hash"
    echo ""
done

# Uncomment if needed:
# echo ""
# echo "Zipping binaries..."
# for file in "$outputDir"/*; do
#     if [[ -f "$file" ]]; then
#         zipPath="${file}.zip"
#         zip -j "$zipPath" "$file"
#         echo "Created $zipPath"
#     fi
# done

echo ""
if $success; then
    echo "All builds completed successfully!"
else
    echo "Some builds failed. Check the output above for details."
    exit 1
fi