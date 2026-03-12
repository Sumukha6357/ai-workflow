# C:\Proj\link-governance.ps1
# 🚀 Global AI Governance & Knowledge Sync System
# This script bonds your project to the Hub and ensures Global Skills/Knowledge are synced.

$HUB_ROOT = "C:\Proj\ai-governance"
# Use $env:USERPROFILE to make the script portable across different Windows users
$AI_USER_ROOT = "$env:USERPROFILE\.gemini\antigravity"

$CURRENT_PATH = Get-Location
$PROJECT_NAME = Split-Path $CURRENT_PATH -Leaf
$CATEGORY = if ($CURRENT_PATH -like "*work*") { "Work" } else { "Personal" }
$PROJECT_HUB = "$HUB_ROOT\projects\$CATEGORY\$PROJECT_NAME"

Write-Host "`n--- 🛡️ AI Governance Onboarding: $PROJECT_NAME ---" -ForegroundColor Cyan

# 1. Hub Registration
if (-not (Test-Path $PROJECT_HUB)) {
    Write-Host "[Registration] New project detected. Initializing Hub metadata..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $PROJECT_HUB -Force | Out-Null
    robocopy "$HUB_ROOT\_templates" $PROJECT_HUB /E /NFL /NDL /NJH /NJS
} else {
    Write-Host "[Registration] Project already registered in Hub." -ForegroundColor Green
}

# 2. Global Workflow Sync (The Slash Command Menu)
Write-Host "[Sync] Updating Global AI Workflows..." -ForegroundColor Yellow
$GLOBAL_WORKFLOW_HUB = "$HUB_ROOT\global-workflows"
$AI_GLOBAL_DIR = "$AI_USER_ROOT\global_workflows"

if (-not (Test-Path $AI_GLOBAL_DIR)) { New-Item -ItemType Directory -Path $AI_GLOBAL_DIR -Force | Out-Null }
robocopy $GLOBAL_WORKFLOW_HUB $AI_GLOBAL_DIR /MIR /NFL /NDL /NJH /NJS

# 3. Knowledge Sync (The Persistent Brain)
Write-Host "[Sync] Synchronizing Global Knowledge Base..." -ForegroundColor Yellow
$KNOWLEDGE_HUB = "$HUB_ROOT\knowledge"
$AI_KNOWLEDGE_DIR = "$AI_USER_ROOT\knowledge"

if (-not (Test-Path $KNOWLEDGE_HUB)) { New-Item -ItemType Directory -Path $KNOWLEDGE_HUB -Force | Out-Null }
robocopy $KNOWLEDGE_HUB $AI_KNOWLEDGE_DIR /MIR /NFL /NDL /NJH /NJS

# 4. Local Project Linking (Single Source of Truth)
$LOCAL_AGENTS = ".agents\workflows"
# Cleanup old mess before syncing
Remove-Item agents, _agent, _agents, .agent -Recurse -Force -ErrorAction SilentlyContinue 2>$null
if (-not (Test-Path ".agents")) { New-Item -ItemType Directory -Path ".agents" -Force | Out-Null }
robocopy $GLOBAL_WORKFLOW_HUB $LOCAL_AGENTS /MIR /NFL /NDL /NJH /NJS

Write-Host "`n--- ✅ SUCCESS: System Fully Synchronized ---" -ForegroundColor Cyan
Write-Host "1. Global Skills updated (Check / menu)."
Write-Host "2. Knowledge Hub synchronized."
Write-Host "3. Project Governance tracked at $PROJECT_HUB."
