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
write-host "5. Reinicio."
write-host "_____________________________ " 
write-host " "
write-host -BackgroundColor Red "*Se recomienda seguir el orden*"
write-host ""
write-host ""

while(($inp = Read-Host -Prompt "Elige una opción") -ne "6"){
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
  write-host "5. Reinicio."
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
  write-host "5. Reinicio."
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
  write-host "5. Reinicio."
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
  write-host "5. Reinicio."
  write-host "_____________________________ "
  break
  }
        5 {
  clear
  write-host " "
  write-host "5. Reinicio."
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
}
}