# Sync Global Orchestration Logic
$ErrorActionPreference = "Stop"

$SourceDir = "$PSScriptRoot\.agent"
$DestDir = "C:\Users\agent\.antigravity\global_orchestrator"
$Timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'
$BackupDir = Join-Path $DestDir "backup\$Timestamp"

Write-Host "🚀 Starting Global Orchestration Sync..." -ForegroundColor Cyan

# 1. Create Backup
if (Test-Path $DestDir) {
    Write-Host "📦 Creating backup of existing config..." -ForegroundColor Gray
    if (-not (Test-Path "$DestDir\backup")) {
        New-Item -ItemType Directory -Force -Path "$DestDir\backup" | Out-Null
    }
    New-Item -ItemType Directory -Force -Path $BackupDir | Out-Null
    
    $items = Get-ChildItem -Path $DestDir -Exclude "backup"
    foreach ($item in $items) {
        Copy-Item -Path $item.FullName -Destination $BackupDir -Recurse -Force
    }
}
else {
    New-Item -ItemType Directory -Force -Path $DestDir | Out-Null
}

# 2. Sync Files
Write-Host "🔄 Migrating fresh files from $SourceDir..." -ForegroundColor Gray

if (Test-Path "$SourceDir\AGENTS.md") {
    Copy-Item -Path "$SourceDir\AGENTS.md" -Destination "$DestDir\AGENTS.md" -Force
}

if (Test-Path "$SourceDir\GEMINI.md") {
    Copy-Item -Path "$SourceDir\GEMINI.md" -Destination "$DestDir\GEMINI.md" -Force
}

if (Test-Path "$SourceDir\skills") {
    Copy-Item -Path "$SourceDir\skills" -Destination "$DestDir\" -Recurse -Force -Exclude ".env", "*.key", "node_modules", ".git"
}

Write-Host "✅ Global Orchestration Logic Updated Successfully!" -ForegroundColor Green
Write-Host "📍 Global Storage: $DestDir" -ForegroundColor White
