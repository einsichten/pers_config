local todaysLogin=~/.logins/$today
if [[ ! -e $todaysLogin ]] then
    touch $todaysLogin
    echo "Last commit:"
    git log -1 --format=%cd
    if [[ $HOSTNAME == 'DEAGM02828' ]] then
        cygstart "$doc/Zeiterfassung.xlsx"
    fi
fi

refa="$c/projects_svn/MachineSafeguardingSuite/branches/Module1_Refactoring"
refa2="$c/projects_svn/MachineSafeguardingS/branches/Module1_Refactoring"
u=/cygdrive/u
desktop=$c/Users/xsostas/Desktop
