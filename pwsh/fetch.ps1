function fetch {
    # Console colors
    $cyan    = 'Cyan'
    $magenta = 'Magenta'
    $red     = 'Red'
    $reset   = 'Gray'

    # Logo colors
    $yellow = "$([char]27)[38;2;255;215;0m"
    $resetAnsi = "$([char]27)[0m"

    # User and computer name
    # $user = $env:USERNAME
    # $computer = $env:COMPUTERNAME
    # $userHost = "$user@$computer"

    # Windows information
    $windowsInfo = Get-CimInstance Win32_OperatingSystem

    $os = $windowsInfo.Caption
    $kernel = "Build $($windowsInfo.BuildNumber)"

    # Uptime
    $bootTime = $windowsInfo.LastBootUpTime
    $uptimeSpan = (Get-Date) - $bootTime

    $uptimeParts = @()

    if ($uptimeSpan.Days -gt 0) {
        $dayText = if ($uptimeSpan.Days -eq 1) { 'day' } else { 'days' }
        $uptimeParts += "$($uptimeSpan.Days) $dayText"
    }

    if ($uptimeSpan.Hours -gt 0) {
        $hourText = if ($uptimeSpan.Hours -eq 1) { 'hour' } else { 'hours' }
        $uptimeParts += "$($uptimeSpan.Hours) $hourText"
    }

    if ($uptimeSpan.Minutes -gt 0) {
        $minuteText = if ($uptimeSpan.Minutes -eq 1) { 'minute' } else { 'minutes' }
        $uptimeParts += "$($uptimeSpan.Minutes) $minuteText"
    }

    if ($uptimeParts.Count -eq 0) {
        $uptime = 'less than a minute'
    }
    else {
        $uptime = $uptimeParts -join ', '
    }

    # Desktop environment
    $de = 'Windows Desktop'

    # Current PowerShell version
    if ($PSVersionTable.PSEdition -eq 'Core') {
        $shell = "PowerShell $($PSVersionTable.PSVersion)"
    }
    else {
        $shell = "Windows PowerShell $($PSVersionTable.PSVersion)"
    }

    # Terminal
    if ($env:WT_SESSION) {
        $term = 'Windows Terminal'
    }
    elseif ($env:ConEmuPID) {
        $term = 'ConEmu'
    }
    elseif ($env:TERM_PROGRAM) {
        $term = $env:TERM_PROGRAM
    }
    else {
        $term = 'Console Host'
    }
   
    # Windows-style logo
    Write-Host ($yellow + '                  m')
    Write-Host ($yellow + 'm  m  m m ,mm, ,mm, ,mm, m  m  m @""`')
    Write-Host ($yellow + '@  @  @ @ @  @ @  @ @  @ @  @  @ mmm ')
    Write-Host ($yellow + '@  @  @ @ @  @ @  @ @  @ @  @  @    @')
    Write-Host ($yellow + '""""""  " "  " """" """" """"""  """"    ' + $resetAnsi)

    # System information
    Write-Host $userHost -ForegroundColor $magenta

    Write-Host 'OS:' -ForegroundColor $cyan -NoNewline
    Write-Host "      $os" -ForegroundColor $reset

    Write-Host 'Kernel:' -ForegroundColor $cyan -NoNewline
    Write-Host "  $kernel" -ForegroundColor $reset

    Write-Host 'Uptime:' -ForegroundColor $cyan -NoNewline
    Write-Host "  $uptime" -ForegroundColor $reset

    Write-Host 'DE:' -ForegroundColor $cyan -NoNewline
    Write-Host "      $de" -ForegroundColor $reset

    Write-Host 'Shell:' -ForegroundColor $cyan -NoNewline
    Write-Host "   $shell" -ForegroundColor $reset

    Write-Host 'Term:' -ForegroundColor $cyan -NoNewline
    Write-Host "    $term" -ForegroundColor $reset

    Write-Host '=====================================' -ForegroundColor $red
}

fetch
