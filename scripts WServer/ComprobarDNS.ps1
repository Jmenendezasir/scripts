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
write-host "Ahora tendremos que reconfigurar ciertos parámetros"
write-host ""
read-host "Pulsa una tecla para continuar..."
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
read-host "Pulsa una tecla para finalizar..."