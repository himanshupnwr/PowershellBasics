NSlookup pluralsight.com | Get-Member

ping  pluralsight.com

nslookup pluralsight.com | Export-CSV .\nslookup.Export-CSV

nslookup pluralsight.com | Get-Member | Export-CSV .\nslookup.Export-CSV

function Query-NameServer([string]$hostname) {
    $addresses = [System.Collections.ArrayList]@();
    $nslookupResult = [PSCustomObject]@{};
    nslookup.exe "$hostname" | ForEach-Object {
      $s = $_.split(':');
      if ($s.Length -gt 1) {
        $fieldName = $s[0].trim();
        if ($fieldName -eq "Addresses") {
          $addresses.add( $s[1].Trim() ) | Out-Null
        } else {
          $nslookupResult | Add-Member -MemberType NoteProperty -Name "$fieldName" -Value $($s[1].Trim());
        }
      } elseif ($s.length -eq 1 -and $fieldName -eq "Addresses" -and $s[0].Trim().length -gt 0 ) {
        $addresses.add($s[0].Trim()) | Out-Null
      }
    };
    $nslookupResult | Add-Member -MemberType NoteProperty -Name "Addresses" -Value $addresses -Force;
    return $nslookupResult;
  }

  Query-NameServer pluralsight.com

  