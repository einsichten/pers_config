export http_proxy="http://fra4.sme.zscalertwo.net:10415"
export https_proxy=$http_proxy

local todaysLogin="$HOME/.logins/$(date +%Y-%m-%d)"
if [[ ! -e $todaysLogin ]] then
    touch $todaysLogin
    cd $doc
    echo "Last commit: $(git log -1 --format=%cd)"
    cygstart "$doc/Zeiterfassung.xlsx"
fi

alias backup_util='cp -urfv $c/Util ~/Dokumente/'
alias logout='backup_util && cd $doc && git add . && git commit -m $today && git push'
alias zeit='cygstart $doc/Zeiterfassung.xlsx'

desktop=$c/Users/xsostas/Desktop
refa="$c/projects_svn/MachineSafeguardingSuite/trunk"
u=/cygdrive/u
