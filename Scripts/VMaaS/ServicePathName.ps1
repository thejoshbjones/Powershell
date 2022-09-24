$services = Get-WmiObject win32_service | Where-Object {($_.PathName -match ' ') -and ($_.PathName -notlike '*.exe -*') -and ($_.PathName -notlike '*`"* *`"*') -and ($_.PathName -notlike '*.exe /*')}

ForEach ($service in $services)
{
Set-Variable -Name "SN" -Value $service.name
Set-Variable -Name "PTH" -Value $service.pathname
Set-Variable -Name "NPTH" -Value `"$PTH`"
Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\$SN' -Name "ImagePath"
#Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\$SN\" -Name "ImagePath" -Value '"C:\Program Files\KDService\bin\KDService.exe"'
}
