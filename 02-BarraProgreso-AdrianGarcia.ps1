#SEGUNDO SCRIPT: CREAR BARRA DE PROGRESO
#ADRIAN GARCIA
# Esta función crea una barra de progreso en PowerShell
function Start-ProgressBar {
    [CmdletBinding()]
    param (
        # Título que se mostrará mientras corre la barra
        [Parameter(Mandatory = $true)]
        $Title,
        
        # Tiempo total (en segundos) que durará la barra de progreso
        [Parameter(Mandatory = $true)]
        [int]$Timer
    )
    
    # Ciclo que avanza segundo a segundo
    for ($i = 1; $i -le $Timer; $i++) {

        # Espera 1 segundo
        Start-Sleep -Seconds 1

        # Calcula el porcentaje completado
        $percentComplete = ($i / $Timer) * 100

        # Actualiza la barra de progreso en la consola
        Write-Progress -Activity $Title -Status "$i seconds elapsed" -PercentComplete $percentComplete
    }
}

# Aquí se llama a la función con un título y una duración de 30 segundos
Start-ProgressBar -Title "Test timeout" -Timer 30
