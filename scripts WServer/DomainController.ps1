Invoke-Expression -Command .\menu.ps1
clear

# Instalamos Active directory y DNS

write-host -ForegroundColor Yellow "1. ACTIVE DIRECTORY Y DNS"
write-host ""
write-host ""
write-host -ForegroundColor Yellow "INSTALACIÓN DE LOS SERVICIOS DE ACTIVE DIRECTORY"
write-host ""
read-host "Pulsa una tecla para continuar..."
    Install-windowsfeature -name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools
    Install-windowsfeature -name DNS -IncludeManagementTools
    Import-module addsdeployment
    echo " " 
    write-host -foregroundcolor Green -nonewline "Instalado correctamente..."
    read-host " Pulsa una tecla para continuar..."
    clear
clear

# Promovemos a controlador de dominio, comprobando si se ha hecho anteriormente o no

if ((get-service -name Netlogon).status -eq "Running") {
    read-host "Ya está promovido a controlador de dominio, pulsa una tecla para continuar..."
    }
else {
write-host -ForegroundColor Yellow "2. PROMOVER A CONTROLADOR DE DOMINIO"
write-host ""
read-host "Pulsa una tecla para continuar..."
$contra = read-host -AsSecureString "Introduce la contraseña de administrador... "
    Import-module addsdeployment
    Install-ADDSForest -DomainName "Midominio.local" -DomainNetBiosName "Midominio" -SafeModeAdministratorPassword (ConvertTo-SecureString -string $contra -AsPlainText -Force) -DomainMode WinThreshold -ForestMode WinThreshold -InstallDNS:$True -Confirm:$false
    echo " " 
    write-host -foregroundcolor Green -nonewline "Se ha promovido a controlador de dominio correctamente..."
    read-host " Reinicia el equipo para continuar..."
    clear

#Instalación de servidor DNS

write-host -ForegroundColor Yellow "3. INSTALACIÓN DE DNS"
write-host ""
write-host -ForegroundColor Yellow "LIMPIAR LA CACHÉ DNS"
read-host "Pulsa una tecla para continuar..."
clear

#Limpiamos la caché de DNS, es muy *IMPORTANTE*

    ipconfig /flushdns
    Clear-DnsClientCache
    Remove-DnsServerZone -name midominio.local -force > $Null
clear
write-host ""
read-host "Pulsa una tecla para continuar..."
clear
}

# Creamos la zona directa e indirecta en DNS

write-host -ForegroundColor Yellow "CREAR ZONA DIRECTA E INDIRECTA"
write-host ""
read-host "Pulsa una tecla para continuar..."

#Borrar Zonas 

Clear-DnsClientCache
Update-DnsServerTrustPoint -force

If ([string]::IsNullOrEmpty((get-dnsserverzone -name "midominio.local" -ErrorAction Ignore).Zonename))
  { 
   echo "Creando zona directa"
   Add-DnsServerPrimaryZone -name midominio.local -Zonefile midominio.local.dns
   if ([string]::IsNullOrEmpty((get-dnsserverzone -name "1.168.192.in-addr.arpa" -ErrorAction Ignore).Zonename)) 
     {
      echo "Creando zona indirecta"
      Add-DnsServerPrimaryZone -NetworkId 192.168.1.0/24 -ZoneFile 1.168.192.in-addr.arpa.dns    
     }
   else 
     {
      echo "Borrando zona inversa"
      Remove-DnsServerZone -name 1.168.192.in-addr.arpa -force
     }
  }
else { echo "Borrando zonas directa e inversa"
       Remove-DnsServerZone -name midominio.local -force
       Remove-DnsServerZone -name 1.168.192.in-addr.arpa -force
     }
Update-DnsServerTrustPoint -force
write-host -ForegroundColor Green -nonewline "Se ha completado correctamente..."
read-host " Pulsa una tecla para continuar..."
write-host ""
write-host "Vamos a crear registros y CNAMES"
write-host ""
read-host "Pulsa una tecla para continuar..."

# Crear registros y CNAMES

Remove-DnsServerResourceRecord -ZoneName midominio.local -Name Server16 -RRType A -Confirm:$false -Force
Add-DnsServerResourceRecordA -IPv4Address 192.168.1.100 -name Server16 -ZoneName midominio.local -CreatePtr
Add-DnsServerResourceRecordCName -HostNameAlias www.midominio.local -Name ftp -ZoneName midominio.local
Add-DnsServerResourceRecordCName -HostNameAlias www.google.es -Name google -ZoneName midominio.local

clear
write-host -ForegroundColor Green -nonewline "Se han registrado correctamente..."
read-host "Pulsa una tecla para continuar..."
clear

# Cambiar propiedades del registro SOA

write-host -ForegroundColor Yellow "CAMBIAR PROPIEDADES DEL REGISTRO SOA"
write-host ""
read-host "Pulsa una tecla para continuar..."

$NuevoSOA = Get-DnsServerResourceRecord -ZoneName midominio.local -RRType SOA
$AntiguoSOA = Get-DnsServerResourceRecord -ZoneName midominio.local -RRType SOA
$NuevoSOA.Recorddata.primaryserver = "Server16.midominio.local"
$NuevoSOA.RecordData.serialNumber = "2021050601" 
set-dnsserverresourcerecord -NewInputObject $NuevoSOA -OldInputObject $AntiguoSOA -ZoneName midominio.local
Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -ServerAddresses "192.168.1.100"

write-host -ForegroundColor Green -NoNewline "Se ha cambiado correctamente..."
read-host "Pulsa una tecla para continuar..."

# Establecer reenviadores

clear
write-host -ForegroundColor Yellow "ESTABLECER REENVIADORES"
write-host ""
write-host "Pulsa una tecla para continuar..."
Add-DnsServerForwarder -IPAddress 8.8.8.8, 8.8.4.4, 1.1.1.1 -PassThru > $Null
write-host -ForegroundColor Green -nonewline "Se han establecido los reenviadores... "
read-host "Pulsa una tecla para continuar..."
invoke-expression -Command .\letras.ps1
write-host -ForegroundColor Yellow "¡Atención! Es posible que por primera vez hayas tenido problemas con DNS"
write-host -ForegroundColor Yellow -nonewline "En ese caso, pulsa enter para continuar, en caso contrario,"
write-host -ForegroundColor Green " ya puedes cerrar el script cerrando la ventana o pulsando CTRL + C"
read-host "Pulsa una tecla para reconfigurar DNS..."
invoke-expression -Command .\ComprobarDNS.ps1
