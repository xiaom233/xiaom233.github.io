[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$projectRoot = Split-Path -Parent $PSScriptRoot
Set-Location -LiteralPath $projectRoot

if (-not (Get-Command ruby -ErrorAction SilentlyContinue)) {
  Write-Host ""
  Write-Host "Ruby was not found." -ForegroundColor Yellow
  Write-Host "Install Ruby+Devkit as described in README.md, then reopen PowerShell."
  Write-Host "Official guide: https://jekyllrb.com/docs/installation/windows/"
  Write-Host ""
  exit 1
}

if (-not (Get-Command bundle -ErrorAction SilentlyContinue)) {
  Write-Host ""
  Write-Host "Bundler was not found." -ForegroundColor Yellow
  Write-Host "Run: gem install bundler"
  Write-Host ""
  exit 1
}

bundle check
if ($LASTEXITCODE -ne 0) {
  Write-Host ""
  Write-Host "Project dependencies are not installed." -ForegroundColor Yellow
  Write-Host "Run: bundle install"
  Write-Host ""
  exit 1
}

Write-Host ""
Write-Host "Starting the local preview..." -ForegroundColor Cyan
Write-Host "Open: http://127.0.0.1:4000"
Write-Host "Stop the preview with Ctrl + C"
Write-Host ""

bundle exec jekyll serve --livereload --host 127.0.0.1 --port 4000
