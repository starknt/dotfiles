oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\iterm2.omp.json" | Invoke-Expression

#-------------------------------  Set utils code BEGIN ------------------------------
function basename($1, $2="") {  return $(split-path "$1" -leaf).trimEnd("$2") }

function mkdir { new-item -Path . -Name "$args" -ItemType "directory" }

function ls([switch]$a,[switch]$l,[switch]$r) {
  $mode = 0
  [string]$path = "$args"
  if($args.length -eq 0) {
    $path = "."
  }
  if($a) {
    $mode = $mode -bor 1
  }
  if($l) {
    $mode = $mode -bor 2
  }
  if($r) {
    $mode = $mode -bor 4
  }

  switch( $mode ) {
    0 { get-childitem -Path $path -Name         } # default ls command output
    1 { get-childitem -Path $path -Name -Force  } # only all -a
    2 { get-childitem -Path $path               } # only list -l
    3 { get-childitem -Path $path -Force        } # -a + -l
    4 { get-childitem -Path $path -Name -s } # only recursive -r
    5 { get-childitem -Path $path -Name -s -Force } # -a + -r
    6 { get-childitem -Path $path -s -Force } # -l + -r
    # 7 { get-childitem -Path $path -Name -s -Force } # -r + -l + -a
  }
}
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
Remove-Item Alias:ls  -Force -ErrorAction Ignore
Remove-Item Alias:gp  -Force -ErrorAction Ignore

# -------------------------------- #
# Alias:
# -------------------------------- #
Set-Alias git hub
Set-Alias nx  nix
Set-Alias mv  move

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

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
