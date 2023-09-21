Kidtimer now controls only running the blacklisted executables (instead of
controlling the login session). The blacklisted executables are listed in

   $dbdir/executables.blacklist (/var/local/kidtimer/executables.blacklist).

Only one exact real full path is required (no symbolic links) per line. See the
provided sample file for blacklisting Firefox.

ATTENTION: Since no user login control will occur after upgrading to this
version of kidtimer, please make sure that the kids users are unlocked
(passwd -u <username>) so they can log in.

Now the DB files are moved to /var/local/kidtimer and are directly editable. This directory can also be mounted from a fileserver for shared use.

### NOTE from the original author:
I have been looking for a solution to this for a long time. I have two kids and wish to restrict their time on the computers. Since nothing else seems to work out there, I decided to write my own. I call it kidtimer. Very original, I know. :)

Kidtimer should work on any recent version of Ubuntu, both 32 & 64 bit. Should also work on Debian too. It uses standard Linux utilities and notify-send (for user notification).

This is how to install it and use it;

1. Download the latest kidtimer deb file;
https://github.com/psagi/kidtimer/raw/master/DEBS/kidtimer_latest.deb

2. Install it using Software Center or use the following lines;
<pre>
sudo dpkg -i kidtimer*.deb
sudo apt-get -f install
</pre>

3. Run it:
<pre>
sudo kidtimer
</pre>

4. Setup a existing user account.

5. Done.

For help:
<pre>
sudo kidtimer help
</pre>

Add time to a user's account (for that day only):
<pre>
sudo kidtimer addtime user minutes
</pre>

To check user's time:
<pre>
sudo kidtimer gettime user
</pre>


Features:

Allow your kid specific hours of the day to access the computer, both weekday and weekend.

Set maximum amount of time, both weekday and weekend.

Keeps track of reward balance that is persistent across days.

Time control can be temporarily suspended/resumed within the day.


Cronjobs:

Check every minute to see if user is logged in. If so, increment total time. If hit max time, disable account and start logoff sequence (5 mins total).

Check hourly to see if user is allowed to login. If so, enable account.

At midnight, reset time.

The application uses notify-send to alert user time is running out. When time runs out, all user processes are terminated, so please prepare user.

Enjoy!
