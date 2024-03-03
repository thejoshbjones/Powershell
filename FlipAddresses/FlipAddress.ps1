$import = import-csv "UserOn-PremUpn221.csv"

foreach ($u in $import)

{

Set-ADUser -Identity $u.SamAccountName -Remove @{Proxyaddresses="SMTP:"+$u.PrimarySMTPAddress}

Set-ADUser -Identity $u.SamAccountName -Remove @{Proxyaddresses="smtp:"+$u.NewPrimarySMTPAddress}

Set-ADUser -Identity $u.SamAccountName -Add @{Proxyaddresses="SMTP:"+$u.NewPrimarySMTPAddress}

Set-ADUser -Identity $u.SamAccountName -Add @{Proxyaddresses="smtp:"+$u.PrimarySMTPAddress}

Set-ADUser -Identity $u.SamAccountName -email $u.newPrimarySMTPAddress

Set-ADUser -Identity $u.SamAccountName -UserPrincipalName $u.newPrimarySMTPAddress

Set-ADUser -Identity $u.SamAccountName -Office $u.Office
}