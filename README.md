# symbolicate_crash

I was so tired of repeatedly copying and pasting ```load address``` and ```address to symbolicate``` in ```atos```, so i wrote this script, so now, i can get a coffee and watch sh*t done.

## Usage:

**First** place ```.dsym```, ```.app``` and ```.crash``` in one directory, so:
```
ls -la
drwxr-xr-x  26 root  staff    832 Oct 22 13:32 MyApp.app
drwxr-xr-x   3 root  staff     96 Oct 22 13:31 MyApp.app.dSYM
-rw-r--r--   1 root  staff  79933 Oct 24 15:51 crashlog-some-hex-number.crash
-rwxrwxrwx   1 root  staff    932 Oct 24 15:50 script.sh

```
**Second** run that stuff like:
```
./script.sh --crash_log crashlog-some-hex-number.crash --dsym MyApp.app.dSYM/Contents/Resources/DWARF/MyApp
```

**Enjoy**

check your ```crashlog-some-hex-number.crash```
