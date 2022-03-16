# Prompt
Import-Module posh-git
Import-Module oh-my-posh
#Set-PoshPrompt Paradox

# Load prompt config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'ra2nx.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression
# Invoke-Expression (&starship init powershell)
# $ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"


Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias dk docker
Set-Alias dkc docker-compose
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias cc cls
Set-Alias tig 'c:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'c:\Program Files\Git\usr\bin\less.exe'

Set-Alias npms 'npm start'
Set-Alias npmd 'npm run dev'
Set-Alias npmss 'npms run serve' 

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
