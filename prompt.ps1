function prompt {
    # $Env:COMPUTERNAME
    # $Env:POWERSHELL_DISTRIBUTION_CHANNEL
    #$host.ui.RawUI.WindowTitle = "Changed Title"
    $host.ui.RawUI.WindowTitle = [Environment]::MachineName + " @ " + [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    Write-Host ""
    Write-Host -NoNewline -Object "[" -ForegroundColor DarkGray
    Write-Host -NoNewline -Object (Get-Date).ToString('HH:mm:ss') -ForegroundColor Yellow
    Write-Host -NoNewline -Object "] " -ForegroundColor DarkGray
    Write-Host -Object $executionContext.SessionState.Path.CurrentLocation.ProviderPath -ForegroundColor DarkGreen
    Write-Host -NoNewLine -Object "PS"
    Write-Host -NoNewline -Object $PSVersionTable.PSVersion.Major, $PSVersionTable.PSVersion.Minor -Separator "." -ForegroundColor DarkCyan
    $Prompt = @(">","#")[[Security.Principal.WindowsIdentity]::GetCurrent().Groups.Value.Contains("S-1-5-32-544")]
    "$($Prompt * ($nestedPromptLevel + 1)) "
    # "$($executionContext.SessionState.Path.CurrentLocation)`nPS $('>' * ($nestedPromptLevel + 1)) ";
}