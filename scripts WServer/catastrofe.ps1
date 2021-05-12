clear
cd C:/
$verde = tree
for ($i=0;$i -lt 10;$i++){
write-host -ForegroundColor Red $Verde
write-host -ForegroundColor Yellow $Verde
write-host -ForegroundColor Blue $Verde
    start-sleep -Seconds 2
write-host -BackgroundColor Yellow "--------------------------------------------"
write-host -BackgroundColor Yellow "    WARNING. I'M DESTROYING YOUR FILES!!    "
write-host -BackgroundColor Yellow "--------------------------------------------"
    start-sleep -Seconds 2
write-host -BackgroundColor Red "--------------------------------------------"
write-host -BackgroundColor Red "    WARNING. I'M DESTROYING YOUR FILES!!    "
write-host -BackgroundColor Red "--------------------------------------------"
clear
}