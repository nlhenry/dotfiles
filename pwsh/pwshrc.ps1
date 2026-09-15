# PowerShell Profile

# Startup
Clear-Host
Set-Location $HOME

# Catppuccin Mocha colors
$Esc = [char]27

$Catppuccin = @{
    Mauve   = "$Esc[38;2;203;166;247m" # #cba6f7
    Blue    = "$Esc[38;2;137;180;250m" # #89b4fa
    Green   = "$Esc[38;2;166;227;161m" # #a6e3a1
    Peach   = "$Esc[38;2;250;179;135m" # #fab387
    Text    = "$Esc[38;2;205;214;244m" # #cdd6f4
    Subtext = "$Esc[38;2;166;173;200m" # #a6adc8
    Reset   = "$Esc[0m"
}

Write-Host "$($Catppuccin.Mauve)Welcome, $env:USERNAME!$($Catppuccin.Reset)"
Write-Host "$($Catppuccin.Blue)Pwsh $($PSVersionTable.PSVersion)$($Catppuccin.Reset)"
Write-Host "$($Catppuccin.Subtext)────────────────────────────────$($Catppuccin.Reset)"

# Prompt
function prompt {
    $user        = $env:USERNAME
    $computer    = $env:COMPUTERNAME.ToLowerInvariant()
    $currentPath = (Get-Location).Path

    # Update the Windows Terminal tab title
    $Host.UI.RawUI.WindowTitle = $currentPath

    # Replace the home path with ~
    if ($currentPath -eq $HOME) {
        $displayPath = "~"
    }
    elseif ($currentPath.StartsWith(
        $HOME,
        [StringComparison]::OrdinalIgnoreCase
    )) {
        $displayPath = "~$($currentPath.Substring($HOME.Length))"
    }
    else {
        $displayPath = $currentPath
    }

    Write-Host "$($Catppuccin.Peach)$user$($Catppuccin.Reset)" -NoNewline
    Write-Host "$($Catppuccin.Text)@$($Catppuccin.Reset)" -NoNewline
    Write-Host "$($Catppuccin.Mauve)$computer$($Catppuccin.Reset)" -NoNewline
    Write-Host "$($Catppuccin.Text):$($Catppuccin.Reset)" -NoNewline
    Write-Host "$($Catppuccin.Green)$displayPath$($Catppuccin.Reset)"

    return "$($Catppuccin.Mauve)❯ $($Catppuccin.Reset)"
}

# Aliases
Set-Alias ll Get-ChildItem
Set-Alias grep Select-String
Set-Alias clr Clear-Host

# Custom ls command
Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue

$LsExclude = @(
    '.android'
    '.cache'
    '.dbus-keyrings'
    '.ms-ad'
    '.openjfx'
    '.thumbnails'
    '.vscode'
    '.vscode-shared'
    '.copilot'
    '3D Objects'
    'Contacts'
    'Cookies'
    'Desktop'
    'Documents'
    'Favorites'
    'Links'
    'Saved Games'
    'Searches'
    'Music'
    'ansel'
    'Recent'
    'Pictures'
    'My Documents'
    'NetHood'
    'SendTo'
    'PrintHood'
    'Start Menu'
    'Templates'
    'Videos'
    'Sti_Trace.log'
    'OneDrive'
)

function ls {
    Get-ChildItem -Force |
        Where-Object {
            $_.Name -notlike 'NTUSER*' -and
            $_.Name -notin $LsExclude
        } |
        Format-Table Name, Length, LastWriteTime -AutoSize
}

# Linux-style commands
function touch {
    param(
        [Parameter(Mandatory)]
        [string]$File
    )

    New-Item -ItemType File -Path $File -Force | Out-Null
}

function rm {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    Remove-Item -Path $Path -Recurse -Force
}

function sudo {
    Start-Process powershell.exe -Verb RunAs
}

# Navigation
Remove-Item Alias:cd -Force -ErrorAction SilentlyContinue

function cd {
    param(
        [string]$Path
    )

    if ([string]::IsNullOrWhiteSpace($Path)) {
        Set-Location $HOME
    }
    else {
        Set-Location $Path
    }
}

function hm {
    Set-Location $HOME
    clr
    .\fetch.ps1
}

# Profile management
function cnf {
    nvim "$HOME/.pwshrc.ps1"
}

function src {
    if (Test-Path -LiteralPath $PROFILE) {
        . $PROFILE
    }
    else {
        Write-Warning "Profile not found: $PROFILE"
    }
}

# Python virtual environments
function cve {
    python -m venv .venv
}

function ave {
    .\.venv\Scripts\Activate.ps1
}

function dve {
    deactivate
}

