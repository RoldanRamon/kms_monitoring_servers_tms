$totalMem = (Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory
$freeMem = (Get-CimInstance -ClassName Win32_OperatingSystem).FreePhysicalMemory * 1KB
$usedMem = $totalMem - $freeMem
$memUsagePercent = ($usedMem / $totalMem) * 100

# Formata o resultado para um número com duas casas decimais
$result = [math]::round($memUsagePercent, 2)

# Especifica o caminho do arquivo onde o resultado será salvo
$path = "C:\Users\rala\Komatsu Forest\UsoDeMemoria - UsoDeMemoria\uso_memoria.txt"

# Salva apenas o número no arquivo de texto com a codificação padrão UTF8
$result.ToString() | Out-File -FilePath $path -Encoding UTF8
