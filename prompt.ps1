function prompt {
    $Title      = [Environment]::MachineName + " @ " + [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $UpperLeft  = $ExecutionContext.SessionState.Path.CurrentLocation.ProviderPath
    $UpperRight = (Get-Date).ToString('HH:mm:ss') + "`n"

    $host.ui.RawUI.WindowTitle = $Title
    Write-Host -NoNewLine -Object $UpperLeft -ForegroundColor Green
    $host.ui.Rawui.CursorPosition = @{ X = $($host.ui.rawui.MaxWindowSize.Width - $UpperRight.Length); Y= $($host.ui.Rawui.CursorPosition.y)};
    Write-Host -NoNewline -Object $UpperRight -ForegroundColor Yellow

    Write-Host -NoNewLine -Object "PS"
    Write-Host -NoNewline -Object $PSVersionTable.PSVersion.Major, $PSVersionTable.PSVersion.Minor -Separator "." -ForegroundColor DarkCyan
    $Prompt = @(">","#")[[Security.Principal.WindowsIdentity]::GetCurrent().Groups.Value.Contains("S-1-5-32-544")]
    "$($Prompt * ($nestedPromptLevel + 1)) "
    # "$($executionContext.SessionState.Path.CurrentLocation)`nPS $('>' * ($nestedPromptLevel + 1)) ";
}