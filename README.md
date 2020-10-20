Now the DB files are moved to /var/local/kidtimer and are directly editable. This directory can also be mounted from a fileserver for shared use.

### NOTE from the original author:
I have been looking for a solution to this for a long time. I have two kids and wish to restrict their time on the computers. Since nothing else seems to work out there, I decided to write my own. I call it kidtimer. Very original, I know. :)

Kidtimer should work on any recent version of Ubuntu, both 32 & 64 bit. Should also work on Debian too. It uses standard Linux utilities and notify-send (for user notification).

### NOTE ###
* The "at" utility is required for kidtimer to work properly.
* Kidtimer will now check when run manually, letting you know what needs to be installed.

So this is how to install it and use it;

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

Cronjobs:

Check every minute to see if user is logged in. If so, increment total time. If hit max time, disable account and start logoff sequence (5 mins total).

Check hourly to see if user is allowed to login. If so, enable account.

At midnight, reset time.

The application uses notify-send to alert user time is running out. When time runs out, all user processes are terminated, so please prepare user.

Enjoy!
