# ================================
# PowerShell Profile
# ================================

# Clear the screen when PowerShell starts
Clear-Host

# ================================
# Catppuccin Mocha Colors
# ================================

$Esc = [char]27

$Catppuccin = @{
    Mauve  = "$Esc[38;2;203;166;247m"  # #cba6f7
    Blue   = "$Esc[38;2;137;180;250m"  # #89b4fa
    Green  = "$Esc[38;2;166;227;161m"  # #a6e3a1
    Peach  = "$Esc[38;2;250;179;135m"  # #fab387
    Text   = "$Esc[38;2;205;214;244m"  # #cdd6f4
    Subtext = "$Esc[38;2;166;173;200m" # #a6adc8
    Reset  = "$Esc[0m"
}

# ================================
# Startup Message
# ================================

Clear-Host

Write-Host "$($Catppuccin.Mauve)Welcome back, $env:USERNAME!$($Catppuccin.Reset)"
Write-Host "$($Catppuccin.Blue)System Shell: PowerShell $($PSVersionTable.PSVersion)$($Catppuccin.Reset)"
Write-Host "$($Catppuccin.Subtext)──────────────────────────────────────────────$($Catppuccin.Reset)"

# Start in your home folder
Set-Location "C:\Users\WA DESIGN3"

# ================================
# Unix-Style Catppuccin Prompt
# ================================

function prompt {
    $user = $env:USERNAME
    $computer = $env:COMPUTERNAME.ToLowerInvariant()
    $currentPath = (Get-Location).Path

    # Update the Windows Terminal tab title without changing the prompt
    $Host.UI.RawUI.WindowTitle = $currentPath

    # Display the home directory as ~
    if ($currentPath -eq $HOME) {
        $displayPath = "~"
    }
    elseif ($currentPath.StartsWith($HOME)) {
        $displayPath = "~" + $currentPath.Substring($HOME.Length)
    }
    else {
        $displayPath = $currentPath
    }

    # user@computer:path
    Write-Host "$($Catppuccin.Peach)$user$($Catppuccin.Reset)" -NoNewline
    Write-Host "$($Catppuccin.Text)@$($Catppuccin.Reset)" -NoNewline
    Write-Host "$($Catppuccin.Mauve)$computer$($Catppuccin.Reset)" -NoNewline
    Write-Host "$($Catppuccin.Text):$($Catppuccin.Reset)" -NoNewline
    Write-Host "$($Catppuccin.Green)$displayPath$($Catppuccin.Reset)"

    # Unix-style prompt symbol
    return "$($Catppuccin.Mauve)❯ $($Catppuccin.Reset)"
}


# ================================
# Simple Aliases
# ================================

Set-Alias ll Get-ChildItem
Set-Alias grep Select-String
Set-Alias clr Clear-Host

# ================================
# Custom ls Command
# ================================

Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue

function ls {
    Get-ChildItem -Force |
        Format-Table Name, Length, LastWriteTime -AutoSize
}

# ================================
# Linux-Style Commands
# ================================

function touch {
    param(
        [Parameter(Mandatory = $true)]
        [string]$File
    )

    New-Item -ItemType File -Path $File -Force | Out-Null
}

function rm {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    Remove-Item -Path $Path -Recurse -Force
}

# ================================
# Administrator PowerShell
# ================================

function sudo {
    Start-Process powershell.exe -Verb RunAs
}

# ================================
# Edit This Profile
# ================================

function cnf {
    nvim $PROFILE
}

# ================================
# Custom cd Command
# ================================

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

# ================================
# Inbox Shortcut
# ================================

function inb {
    Set-Location "C:\Users\WA DESIGN3\Inbox"
}

