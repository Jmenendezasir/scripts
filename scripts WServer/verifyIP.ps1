clear
    $Cadena = Read-Host "Dame dirección IP (xxx.xxx.xxx.xxx): "
if ($Cadena -match "^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$" )
    {
        if([ipaddress]::TryParse(($Cadena),[ref][ipaddress]::Loopback))
        {
            echo "La direcció IP es correcta"
        }
 else
        {
            echo "La dirección IP es incorrecta."
        }
    }
   else
   {
    echo "La cadena de la IP $Cadena no es correcta."
   }