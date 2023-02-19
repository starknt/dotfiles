oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\iterm2.omp.json" | Invoke-Expression

#-------------------------------  Set utils code BEGIN ------------------------------
function basename($1) {  return $(split-path "$1" -leaf).split(".")[0] }

function mkdir { new-item -Path . -Name "$args" -ItemType "directory" }
#-------------------------------  Set utils code END  -------------------------------

#-------------------------------  Set Hot-keys BEGIN  -------------------------------
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function ViExit
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
#-------------------------------  Set Hot-keys END    -------------------------------

# antfu/ni
Remove-Item Alias:ni  -Force -ErrorAction Ignore
Remove-Item Alias:dir -Force -ErrorAction Ignore

# -------------------------------- #
# Alias:
# -------------------------------- #
Set-Alias -Name git -Value hub
Set-Alias -Name nx -Value nix
Set-Alias -Name mv -Value move

function grt  { cd $(git rev-parse --show-toplevel) }
function gs   { git status $args }
function gp   { git push $args }
function gpf  { git push --force $args }
function gpft { git push --follow-tags $args }
function gpl  { git pull --rebase $args }
function gcl  { git clone $args }
function gst  { git stash $args }
function grm  { git rm $args }
function gmv  { git mv $args }

function main { git checkout main }

function nio { ni --prefer-offline }
function s { nr start }
function d { nr dev }
function t { nr test }
function tu { nr test -u }
function tw { nr test --watch }
function c { nr typecheck }
function lint { nr lint }
function lintf { nr lint --fix }
function release { nr release }

# -------------------------------- #
# Directories
#
# I put
# `~/workspace/i` for my projects
# `~/workspace/f` for forks
# `~/workspace/r` for reproductions
# -------------------------------- #
function i { cd e:/workspace/i/$args }
function repros { cd e:/workspace/r/$args }
function forks { cd e:/workspace/f/$args }

function dir {  mkdir "$args" && cd "$args" }

function clone($1, $2) {
  if($2 -eq $null) {
    hub clone $1 $args && cd $(basename $1 .git)
  } else {
    hub clone $1 $2 $args && cd "$2"
  }
}

function clonei { i && clone $args && code . }
function cloner { repros && clone $args && code . }
function clonef { forks && clone $args && code . }
function codei { i && code $args && cd - }

