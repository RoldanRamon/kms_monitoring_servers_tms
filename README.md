# 🖥️ Monitoramento de Memória de Servidores - TMS (Total Memory Surveillance)

## 📋 Visão Geral

Este projeto oferece uma solução automatizada para monitorar o uso de memória dos servidores, com alertas proativos enviados por e-mail quando o consumo excede 60%. A solução combina o uso de scripts PowerShell, um executável simples em batch, e um fluxo no Power Automate que monitora e reage às condições do sistema.

## 📁 Estrutura do Projeto

- **Executável (`run_memory_check.bat`)**
  - Este script em batch executa um script PowerShell que verifica o uso atual de memória do servidor.
  
  ```batch
  @echo off
  REM Executa o script PowerShell para criar o arquivo uso_memoria.txt
  powershell.exe -ExecutionPolicy Bypass -File "C:\Users\rala\Downloads\alerta_memoria\verificar_memoria.ps1"
  ```

 ## Script PowerShell (verificar_memoria.ps1)

Calcula a memória total, a memória livre, e o percentual de uso da memória. Se o uso de memória for superior a 60%, salva o resultado em um arquivo de texto.

```batch
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
```
## Fluxo Power Automate

Um fluxo monitorando uma pasta no SharePoint onde o arquivo uso_memoria.txt é criado. Se o consumo de memória ultrapassar 60%, o fluxo enviará um alerta por e-mail ao analista de infraestrutura.

## 🚀 Funcionalidades Futuras
- Alertas em tempo real via chat, WhatsApp, ou Telegram para notificações mais ágeis.
- Armazenamento dos dados de uso de memória em um banco de dados centralizado.
- Dashboard de Análise para visualização dos picos de consumo de memória em todas as máquinas do servidor, facilitando a análise de tendências e a tomada de decisões.


## 🛠️ Como Usar
- Clone este repositório ou baixe o zip do projeto.
- Configure o caminho no script batch e PowerShell para apontar para os locais corretos em seu ambiente.
- Importe o fluxo Power Automate incluído no projeto e ajuste as configurações de envio de e-mail conforme necessário.
- Execute o arquivo batch para iniciar o monitoramento.


## 🤝 Contribuições
Contribuições são bem-vindas! Se você tiver ideias para aprimorar este projeto, sinta-se à vontade para abrir uma issue ou enviar um pull request.

## 📄 Licença
Este projeto é licenciado sob a Licença MIT.

Autor: Ramon Roldan de Lara
Email: rolranramon83@gmail.com