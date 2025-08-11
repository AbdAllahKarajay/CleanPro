# PowerShell script to generate Android launcher icons
# This script uses ImageMagick to convert the vector drawable to PNG files

# Check if ImageMagick is installed
try {
    magick --version | Out-Null
    Write-Host "ImageMagick found, proceeding with icon generation..." -ForegroundColor Green
} catch {
    Write-Host "ImageMagick not found. Please install ImageMagick first:" -ForegroundColor Red
    Write-Host "https://imagemagick.org/script/download.php#windows" -ForegroundColor Yellow
    exit 1
}

# Create directories if they don't exist
$directories = @(
    "android/app/src/main/res/mipmap-mdpi",
    "android/app/src/main/res/mipmap-hdpi", 
    "android/app/src/main/res/mipmap-xhdpi",
    "android/app/src/main/res/mipmap-xxhdpi",
    "android/app/src/main/res/mipmap-xxxhdpi"
)

foreach ($dir in $directories) {
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "Created directory: $dir" -ForegroundColor Green
    }
}

# Icon sizes for different densities
$sizes = @{
    "mdpi" = 48
    "hdpi" = 72
    "xhdpi" = 96
    "xxhdpi" = 144
    "xxxhdpi" = 192
}

# Generate icons for each density
foreach ($density in $sizes.Keys) {
    $size = $sizes[$density]
    $outputPath = "android/app/src/main/res/mipmap-$density/ic_launcher.png"
    
    # Create a simple blue icon with white background
    $svgContent = @"
<svg width="$size" height="$size" xmlns="http://www.w3.org/2000/svg">
    <rect width="$size" height="$size" fill="white"/>
    <g transform="translate($($size/2), $($size/2)) scale($($size/200))">
        <!-- Water droplet -->
        <path fill="#2196F3" d="M100,40 C100,40 80,70 80,100 C80,130 100,160 100,160 C100,160 120,130 120,100 C120,70 100,40 100,40 Z"/>
        
        <!-- Stars -->
        <path fill="#2196F3" d="M140,60 L144,68 L152,68 L146,74 L148,82 L140,78 L132,82 L134,74 L128,68 L136,68 Z"/>
        <path fill="#2196F3" d="M136,50 L138,54 L142,54 L139.5,57 L140,61 L136,59 L132,61 L132.5,57 L130,54 L134,54 Z"/>
        
        <!-- Text "Beti" -->
        <path fill="#2196F3" d="M70,120 L70,140 L74,140 L74,124 L80,140 L84,140 L90,124 L90,140 L94,140 L94,120 L88,120 L84,134 L80,134 L76,120 Z"/>
        <path fill="#2196F3" d="M98,120 L98,140 L102,140 L102,120 Z"/>
        <path fill="#2196F3" d="M106,120 L106,140 L110,140 L110,136 L114,140 L118,140 L114,136 L114,120 Z"/>
        <path fill="#2196F3" d="M122,120 L122,140 L126,140 L126,120 Z"/>
        <path fill="#2196F3" d="M130,120 L130,140 L134,140 L134,120 L130,120 M130,136 L134,136"/>
    </g>
</svg>
"@
    
    # Save SVG temporarily
    $tempSvg = "temp_icon.svg"
    $svgContent | Out-File -FilePath $tempSvg -Encoding UTF8
    
    # Convert SVG to PNG using ImageMagick
    try {
        magick convert $tempSvg -background white $outputPath
        Write-Host "Generated icon: $outputPath" -ForegroundColor Green
    } catch {
        Write-Host "Failed to generate icon for $density" -ForegroundColor Red
    }
    
    # Clean up temp file
    if (Test-Path $tempSvg) {
        Remove-Item $tempSvg
    }
}

Write-Host "Icon generation complete!" -ForegroundColor Green
Write-Host "You can now build your Android app with the new Beti launcher icon and splash screen." -ForegroundColor Cyan
