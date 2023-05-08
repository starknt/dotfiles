oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\powerlevel10k_rainbow.omp.json" | Invoke-Expression

#-------------------------------  Set utils code BEGIN ------------------------------
function basename([string]$1, $2="") { return $(split-path "$1" -leaf) -replace "$2" }

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

function touch { new-item -Path $args -ItemType "file" }
function op([string]$path=".") { Invoke-Item  $path }
#-------------------------------  Set utils code END  -------------------------------

#-------------------------------  Set Hot-keys BEGIN  -------------------------------
# Set-PSReadLineOption -PredictionSource History
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
# Set-Alias git hub
Set-Alias nx  nix
Set-Alias mv  move

function gco{ git checkout }
function gcob{ git checkout -b }
function gb{ git branch }
function gbd{ git branch -d }
function grb{ git rebase }
function grbom{ git rebase origin/master }
function grbc{ git rebase --continue }
function gl{ git log }
function glo{ git log --oneline --graph }
function grh{ git reset HEAD }
function grh1{ git reset HEAD~1 }
function ga{ git add }
function gA{ git add -A }
function gc{ git commit }
function gcm{ git commit -m }
function gca{ git commit -a }
function gcam{ git add -A && git commit -m }
function gfrb{ git fetch origin && git rebase origin/master }
function gxn{ git clean -dn }
function gx{ git clean -df }
function gsha{ git rev-parse HEAD | pbcopy }

function ghci { gh run list -L 1 }

function glp() {
  git --no-pager log -$1
}
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

function op($1=".") { Invoke-Item $1 }

function nio { ni --prefer-offline }
function s { nr start }
function d { nr dev }
function b { nr build}
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
# `~/workspace/l` for learn
# -------------------------------- #
$workspace="e:/workspace"
function i { cd $workspace/i/$args }
function repros { cd $workspace/r/$args }
function forks { cd $workspace/f/$args }
function learn { cd $workspace/l/$args }

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
function coder { i && code -r $args && cd - }

# variables
# $WinNetIP=$(Get-NetIPAddress -InterfaceAlias 'vEthernet (WSL)' -AddressFamily IPV4)
# adb connect 127.0.0.1:58526 && adb shell settings put global http_proxy "$($WinNetIP.IPAddress):7890"
# adb shell settings put global http_proxy :0

function wsaproxy() { 
  $WinNetIP=$(Get-NetIPAddress -InterfaceAlias 'vEthernet (WSL)' -AddressFamily IPV4)
  adb connect 127.0.0.1:58526
  adb shell settings put global http_proxy "$($WinNetIP.IPAddress):7890"
  adb shell settings put global https_proxy "$($WinNetIP.IPAddress):7890"
}

function proxy() {
  $Env:http_proxy="http://127.0.0.1:7890"
  $Env:https_proxy="http://127.0.0.1:7890"
}

function noproxy() {

}

function update() {
  # pnpm update
  iwr https://get.pnpm.io/install.ps1 -useb | iex
  # update global node_modules
  ni -g upgrade
}
