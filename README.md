# Compare Ini Files

The problem: You have multiple copies of an "ini" file (https://en.wikipedia.org/wiki/INI_file) 
in use by an app (possibly an app deployed in multiple datacenters...), and you want to compare them/diff them.  Or worse yet: the stanzas and key-value pairs are in different orders in each file, and sorting through them would be a manual process that takes hours and is prone to error.

Solution: This script.  The syntax is simple: 
```
./compare-ini-files filename1 filename2 [filename3 [filename4 [... ] ] ]
```


After loading the contents of the specified files into memory, this script
then checks to make sure all stanzas exist in each file, then does a key-by-key
comparison on each stanza, and reports any differences between the files.

## Testing out the script

Clone this repo, and run `./compare-ini-files test/*` on the command line.
The output should resemble this:

```
#
# Starting config file audit of the following files:
#
#       test/file1.conf
#       test/file2.conf
#       test/file3.conf
#
#
# Loading files...
#
#
# Comparing contents...
#
File: 'test/file3.conf' is missing the following stanzas:
        this stanza is found in file 1 and 2

Stanza: common
        Key: 'specific to file3' found with multiple values:
                Value 'somevalue' found in files:
                        test/file3.conf
                These files did NOT contain the key:
                        test/file1.conf
                        test/file2.conf

```


## Requirements

- A relatively recent version of PHP should be installed.
- Read access to the files in question


## Author
<a name="author"></a>

Douglas Muth <douglas_muth@cable.comcast.com>

Bugs can be filed here or emailed directly to me.




