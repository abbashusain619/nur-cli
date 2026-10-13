Write-Host "🚀 Installing Nuru Package Manager (nur)..."

$InstallDir = "$env:USERPROFILE\.nur\bin"
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

Write-Host "⬇️ Fetching Windows binary..."
# Note: We will update this URL once the GitHub Action generates the .exe
$DownloadUrl = "https://github.com/abbashusain619/nur-cli/releases/latest/download/nur.exe"
$ExePath = "$InstallDir\nur.exe"

Invoke-WebRequest -Uri $DownloadUrl -OutFile $ExePath

Write-Host "🔧 Configuring Windows PATH..."
$UserPath = [Environment]::GetEnvironmentVariable("PATH", "User")

if ($UserPath -notlike "*$InstallDir*") {
    $NewPath = "$InstallDir;$UserPath"
    [Environment]::SetEnvironmentVariable("PATH", $NewPath, "User")
    Write-Host "✅ PATH configured."
}

Write-Host "✅ Installation complete! Restart your PowerShell or CMD terminal."