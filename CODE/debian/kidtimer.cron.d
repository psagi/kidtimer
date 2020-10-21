0 * * * *                root        /usr/bin/kidtimer hourly >/dev/null
0 0 * * *                root        /usr/bin/kidtimer daily >/dev/null
* * * * *                root        /usr/bin/kidtimer check >/dev/null
@reboot                root        /usr/bin/kidtimer daily >/dev/null
