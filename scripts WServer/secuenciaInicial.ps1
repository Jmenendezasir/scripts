clear
$DIR="c:"
write-host -BackgroundColor Blue "--------------------------"
write-host -BackgroundColor Blue "  CONFIGURACIÓN ESTABLE   "
write-host -BackgroundColor Blue "--------------------------"
write-host " "
write-host " "
write-host -BackgroundColor Green "*SELECCIONA UNA OPCIÓN...*"
write-host " "
write-host "_____________________________ "
write-host "1. Desactivar Windows Defender."
write-host "2. Desactivar Firewall de Windows."
write-host "3. Desactivar Control de Cuentas de Usuario."
write-host "4. Cambiar de nombre al servidor."
write-host "5. Deshabilitar el protocolo iPv6."
write-host "6. Configurar una dirección iPv4 estática."
write-host "7. Reiniciar."
write-host "8. Salir."
write-host "_____________________________ " 
write-host " "
write-host -BackgroundColor Red "*Se recomienda seguir el orden*"
write-host ""
write-host ""

while(($inp = Read-Host -Prompt "Elige una opción") -ne "9"){
switch($inp){
        1 {
  clear
  write-host " "
  write-host "1. Desactivar Windows Defender"
  write-host " "
  write-host " "
  write-host " "
  Read-Host -Prompt "Pulsa cualquier tecla para continuar..."
  write-host "Desinstalando Windows Defender, por favor, espera..."
  Uninstall-WindowsFeature -Name Windows-Defender
  write-host ""
  write-host -ForegroundColor Green "Se ha desinstalado Windows Defender correctamente"
  write-host ""
  Read-Host -Prompt "Pulsa una tecla para volver al menú principal..."
  clear
  write-host "*SELECCIONA UNA OPCIÓN...*"
  write-host " "
  write-host "_____________________________ "
  write-host "1. Desactivar Windows Defender... *OK"
  write-host "2. Desactivar Firewall de Windows."
  write-host "3. Desactivar Contro de Cuentas de Usuario."
  write-host "4. Cambiar de nombre al servidor."
  write-host "5. Deshabilitar el protocolo iPv6."
  write-host "6. Configurar una dirección iPv4 estática."
  write-host "7. Reiniciar."
  write-host "8. Salir."
  write-host "_____________________________ " 
  break
  }
        2 {
  clear
  write-host " "
  write-host "2. Desactivar Firewall de Windows"
  write-host " "
  write-host " "
  write-host " "
  Read-Host -Prompt "Pulsa cualquier tecla para continuar..."
  Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
  write-host " "
  write-host -ForegroundColor Green "Se ha desactivado Windows Defender completamente."
  write-host " "
  write-host -BackgroundColor Red "Mantén esta función deshabilitada bajo tu propio riesgo."
  write-host -BackgroundColor Red "Se recomienda la configuración de un Firewall físico."
  write-host " "
  Read-Host -Prompt "Pulsa una tecla para volver al menú principal..."
  clear
  write-host "*SELECCIONA UNA OPCIÓN...*"
  write-host " "
  write-host "_____________________________ "
  write-host "1. Desactivar Windows Defender... *OK"
  write-host "2. Desactivar Firewall de Windows... *OK"
  write-host "3. Desactivar Control de Cuentas de Usuario."
  write-host "4. Cambiar de nombre al servidor."
  write-host "5. Deshabilitar el protocolo iPv6."
  write-host "6. Configurar una dirección iPv4 estática."
  write-host "7. Reiniciar."
  write-host "8. Salir."
  write-host "_____________________________ "
  break
  }
        3 {
  clear
  write-host " "
  write-host "3. Desactivar Control de Cuentas de Usuario."
  write-host " "
  write-host " "
  write-host " "
  Read-Host -Prompt "Pulsa cualquier tecla para continuar..."
   cd HKLM:\
   $RegKey ='HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system' 
   Set-ItemProperty -Path $RegKey -Name EnableLUA -Value 0 -Confirm:$False
  write-host -ForegroundColor Green "Se ha desactivado el control de cuentas de usuario completamente."
  cd $DIR
  write-host " "
  Read-Host -Prompt "Pulsa una tecla para volver al menú principal..."
  clear
  write-host "*SELECCIONA UNA OPCIÓN...*"
  write-host " "
  write-host "_____________________________ "
  write-host "1. Desactivar Windows Defender... *OK"
  write-host "2. Desactivar Firewall de Windows... *OK"
  write-host "3. Desactivar Control de Cuentas de Usuario... *OK"
  write-host "4. Cambiar de nombre al servidor."
  write-host "5. Deshabilitar el protocolo iPv6."
  write-host "6. Configurar una dirección iPv4 estática."
  write-host "7. Reiniciar."
  write-host "8. Salir."
  write-host "_____________________________ "
  break
  }
        4 {
  clear
  write-host " "
  write-host "4. Cambiar de nombre al servidor."
  write-host " "
  write-host " "
  write-host " "
  Read-Host "Pulsa cualquier tecla para continuar..."
  $nombre = Read-Host "Introduce un nuevo nombre para el servidor"
  Rename-Computer -NewName $nombre -force -Confirm:$False
  write-host -ForegroundColor Green "Se ha cambiado correctamente a $nombre"
  write-host " "
  Read-Host -Prompt "Pulsa una tecla para volver al menú principal..."
  clear
  write-host "*SELECCIONA UNA OPCIÓN...*"
  write-host " "
  write-host "_____________________________ "
  write-host "1. Desactivar Windows Defender... *OK"
  write-host "2. Desactivar Firewall de Windows... *OK"
  write-host "3. Desactivar Control de Cuentas de Usuario... *OK"
  write-host "4. Cambiar de nombre al servidor... *OK"
  write-host "5. Deshabilitar el protocolo iPv6."
  write-host "6. Configurar una dirección iPv4 estática."
  write-host "7. Reiniciar."
  write-host "8. Salir."
  write-host "_____________________________ "
  break
  }
        5 {
    clear
  write-host " "
  write-host "5. Deshabilitar el protocolo iPv6."
  write-host " "
  write-host " "
  write-host " "
  Read-Host "Pulsa cualquier tecla para continuar..."
  write-host " "
  reg add hklm\system\currentcontrolset\services\tcpip6\parameters /v DisabledComponents /t REG_DWORD /d 0xFF /f
  Get-NetAdapterBinding -ComponentID "ms_tcpip6" | disable-NetAdapterBinding -ComponentID "ms_tcpip6" –PassThru
  write-host " "
  write-host " "
  write-host -ForegroundColor Green "Se ha deshabilitado el protocolo iPv6 correctamente"
  write-host ""
  write-host ""
  read-host "Pulsa una tecla para volver al menú principal..."
  clear
  write-host "*SELECCIONA UNA OPCIÓN...*"
  write-host " "
  write-host "_____________________________ "
  write-host "1. Desactivar Windows Defender... *OK"
  write-host "2. Desactivar Firewall de Windows... *OK"
  write-host "3. Desactivar Control de Cuentas de Usuario... *OK"
  write-host "4. Cambiar de nombre al servidor... *OK"
  write-host "5. Deshabilitar el protocolo iPv6... *OK"
  write-host "6. Configurar una dirección iPv4 estática."
  write-host "7. Reiniciar."
  write-host "8. Salir."
  write-host "_____________________________ "
  break
        }
        6 {
  clear
  write-host " "
  write-host "6. Configurar una dirección iPv4 estática."
  write-host " "
  write-host " "
  write-host " "
  Read-Host "Pulsa cualquier tecla para continuar..."
  write-host " "
  $ipestatica = read-host "Introduce una dirección estática"
     if ($ipestatica -match "^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$" )
      {   
        if ([ipaddress]::TryParse(($ipestatica),[ref][ipaddress]::Loopback))  
            {
            clear
            echo "La dirección IP es correcta"
                Set-ItemProperty -Path “HKLM:\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\$((Get-NetAdapter -InterfaceIndex (Get-NetAdapter).InterfaceIndex).InterfaceGuid)” 
                -Name EnableDHCP -Value 0 -PassThru -Force -Confirm:$False
                Remove-NetIpAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -AddressFamily IPv4 -Confirm:$False -PassThru
                Remove-NetRoute -InterfaceIndex (Get-NetAdapter).InterfaceIndex -AddressFamily IPv4 -Confirm:$False -PassThru
            $puertaenlace = read-host "Introduce un gateway"
            $serverdns = read-host "Introduce un servidor DNS"
                New-NetIpAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -IpAddress $ipestatica -PrefixLength 24 -DefaultGateway $puertaenlace -AddressFamily IPv4 -Confirm:$False
                Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -ServerAddresses $serverdns
            write-host " "
            write-host " "
            write-host -ForegroundColor Green "Se ha registrado correctamente tu configuración IP con los siguientes datos: "
            write-host -ForegroundColor Green "IP estática:  $ipestatica"
            write-host -ForegroundColor Green "Gateway:  $puertaenlace"
            write-host -ForegroundColor Green "Servidor DNS:  $serverdns"
            write-host ""
            write-host ""
            read-host "Pulsa una tecla para volver al menú principal..."
            clear
              write-host "*SELECCIONA UNA OPCIÓN...*"
              write-host " "
              write-host "_____________________________ "
              write-host "1. Desactivar Windows Defender... *OK"
              write-host "2. Desactivar Firewall de Windows... *OK"
              write-host "3. Desactivar Control de Cuentas de Usuario... *OK"
              write-host "4. Cambiar de nombre al servidor... *OK"
              write-host "5. Deshabilitar el protocolo iPv6... *OK"
              write-host "6. Configurar una dirección iPv4 estática... OK*"
              write-host "7. Reiniciar."
              write-host "_____________________________ "
              break
            }
      else
          {
             echo "La dirección IP es incorrecta"
             break
          } 
       }
     else 
       { 
        echo "La cadena de la IP $ipestatica no es correcta"
        break
       }
        }

        7 {
  clear
  write-host " "
  write-host "7. Reinicio."
  write-host " "
  write-host " "
  write-host " "
  write-host "Se procederá a reiniciar el equipo para aplicar los cambios..."
  write-host " "
  write-host " "
  write-host -ForegroundColor Red "Guarda todos tus cambios antes de proceder, pueden perderse"
  Read-host "Pulsa una tecla para continuar..."
  restart-computer -Confirm:$False
        }

        8 {
        clear
        Write-Host -ForegroundColor yellow "Gracias por confiar en Josico Informática S.L"
        exit
        }
  }
}