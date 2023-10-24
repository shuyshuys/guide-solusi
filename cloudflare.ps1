$host.UI.RawUI.WindowTitle = "RDP to VM-Windows"
$FolderName = "C:\cloudflared\bin"
if (-Not(Test-Path $FolderName)) {
    New-Item $FolderName -ItemType Directory
    Write-Host "Folder Created successfully"
    cd $FolderName
    Write-Host "Download cloudflared > C:\cloudflared\bin"
    Invoke-WebRequest -OutFile cloudflared.exe -Uri https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe
}
cd $FolderName
Write-Host "Don't close if still using rdp"
.\cloudflared access rdp --hostname rdp.isslab.tech --url localhost:3390 --destination VM-WINDOWS.local:3389
mstsc /v:localhost:3390
