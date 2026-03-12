# C:\Proj\ai-governance\config\link_hub.ps1
# 🚀 Global AI Governance activation script for New Machines

$HUB_ROOT = "C:\Proj\ai-governance"
$AI_USER_ROOT = "$env:USERPROFILE\.gemini\antigravity"

Write-Host "`n--- 🧠 Establishing Neural Hub Link ---" -ForegroundColor Cyan

# Ensure AI config folders exist before linking
if (-not (Test-Path "$AI_USER_ROOT")) { New-Item -ItemType Directory -Path "$AI_USER_ROOT" -Force | Out-Null }

# 1. Link Workflows/Skills
$SKILLS_LINK = "$AI_USER_ROOT\global_workflows"
if (Test-Path $SKILLS_LINK) { Remove-Item $SKILLS_LINK -Recurse -Force -ErrorAction SilentlyContinue }
New-Item -ItemType Junction -Path $SKILLS_LINK -Target "$HUB_ROOT\global-workflows" -Force | Out-Null
Write-Host "✅ Skills Link Established (C:\Proj AI Hub Linked)." -ForegroundColor Green

# 2. Link Knowledge/Memory
$KNOWLEDGE_LINK = "$AI_USER_ROOT\knowledge"
if (Test-Path $KNOWLEDGE_LINK) { Remove-Item $KNOWLEDGE_LINK -Recurse -Force -ErrorAction SilentlyContinue }
New-Item -ItemType Junction -Path $KNOWLEDGE_LINK -Target "$HUB_ROOT\knowledge" -Force | Out-Null
Write-Host "✅ Knowledge Link Established (C:\Proj Memory Linked)." -ForegroundColor Green

Write-Host "--- Ready. Your AI brain is now physically part of the Hub. ---" -ForegroundColor Cyan
