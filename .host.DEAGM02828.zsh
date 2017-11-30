local todaysLogin=~/.logins/$today
if [[ ! -e $todaysLogin ]] then
    touch $todaysLogin
    cd $doc
    echo "Last commit:"
    git log -1 --format=%cd
    if [[ $HOSTNAME == 'DEAGM02828' ]] then
        cygstart "$doc/Zeiterfassung.xlsx"
    fi
fi

refa="$c/projects_svn/MachineSafeguardingSuite/trunk"
alias m1s='open /cygdrive/c/projects_svn/MachineSafeguardingSuite/trunk/MSS.Module1/src/MSS.Module1.sln' # solution module1
alias zeit='cygstart $doc/Zeiterfassung.xlsx'
alias logout='backup_util && cd $doc && git add . && git commit -m $today && git push'
alias backup_util='cp -urfv $c/Util ~/Dokumente/'
u=/cygdrive/u
desktop=$c/Users/xsostas/Desktop

export http_proxy="http://fra4.sme.zscalertwo.net:10415"
export https_proxy=$http_proxy
