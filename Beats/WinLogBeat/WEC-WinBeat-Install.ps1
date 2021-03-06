### WEC-WinBeat-Install
### https://www.elastic.co/downloads/

###
New-Item -ItemType Directory -Path 'C:\Program Files' -Name Elactic -ErrorAction SilentlyContinue

###
Expand-Archive -Path C:\Users\administrator.hq\Downloads\winlogbeat-7.7.0-windows-x86_64.zip -DestinationPath 'C:\Elactic' -Force -Verbose
Rename-Item -Path 'C:\Elactic\winlogbeat-7.7.0-windows-x86_64' -NewName 'C:\Elactic\winlogbeat' -Force -Verbose
Rename-Item -Path 'C:\Elactic\winlogbeat\winlogbeat.yml' -NewName 'C:\Elactic\winlogbeat\winlogbeat.yml.bak' -Force -Verbose

### Create WinLogBeat File
##########################
$WinLogBeatYml = '
### Read ForwardedEvents Channel 
winlogbeat.event_logs:
    - name: ForwardedEvents

### Set registry_file for Channel Read Position
winlogbeat.registry_file: C:/ProgramData/winlogbeat/.winlogbeat.yml

### Time out before shutdown
winlogbeat.shutdown_timeout: 30s

### Output to LogStash
output.logstash:
    enabled: true
    hosts: ["127.0.0.1:5044"]
    compression_level: 1
'
##########################

### Create New WinLogBeat.yml
New-Item -ItemType 'File' -Path 'C:\Elactic\winlogbeat' -Name 'winlogbeat.yml' -Force -Verbose
Set-Content -Path 'C:\Elactic\winlogbeat\winlogbeat.yml' -Value $WinLogBeatYml -Force -Verbose
