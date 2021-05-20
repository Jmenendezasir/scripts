clear

# script para incluir un cliente en el dominio

# Consideraciones previas:
# Nuestro equipo cliente se llama Win10
# Las credenciales locales son Win10\Usuario
# El nombre del Dominio es Midominio.local
# Las credenciales del dominio son MIDOMINIO\administrador

# Sobre FireWall:
# El uso del SkipNetworkProfileCheck abree el firewall de Windows para la comunicación remota de PowerShell en su perfil de red actual,
# pero solo permitirá conexiones remotas desde máquinas en la misma subred.

# Dos parámetros que se pueden utilizar con Enable-PSRemoting son -Force y -Confirm.
# -Force para omitir todas las indicaciones que Enable-PSRemoting normalmente le daría al ejecutar el comando.
# -Confirm:$false obtendría el mismo resultado que -Forece


write-host ""
write-host "    _______   ____________  ___    ____     _______   __   ________       ____  ____  __  ________   __________ "
write-host "   / ____/ | / /_  __/ __ \/   |  / __ \   / ____/ | / /  / ____/ /      / __ \/ __ \/  |/  /  _/ | / /  _/ __ \"
write-host "  / __/ /  |/ / / / / /_/ / /| | / /_/ /  / __/ /  |/ /  / __/ / /      / / / / / / / /|_/ // //  |/ // // / / /"
write-host " / /___/ /|  / / / / _, _/ ___ |/ _, _/  / /___/ /|  /  / /___/ /___   / /_/ / /_/ / /  / // // /|  // // /_/ / "
write-host "/_____/_/ |_/ /_/ /_/ |_/_/  |_/_/ |_|  /_____/_/ |_/  /_____/_____/  /_____/\____/_/  /_/___/_/ |_/___/\____/  "
write-host ""
read-host "Pulsa una tecla para entrar en MIDOMINIO"
Enable-PSRemoting
Enable-PSRemoting -SkipNetworkProfileCheck
Enter-PSSession

Add-Computer -ComputerName $equipo -LocalCredential $equipo\usuario -DomainName midominio.local -Credential midominio\administrador -Restart

