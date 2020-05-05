# File-Changed-Trigger-Script

## Description

This is a script which monitors a markdown file for changes - on write/save, it converts the markdown file to an html one also opening the export using the default xdg-open browser.

## Quick intro

What you basically need is to call the script with the folder in which the file you want to monitor is located and the name of the file, as:

```console
./watch.sh directory file
```

This will trigger ifnotifywait to monitor the specific file, and when it is saved, to export it to html and pop up the browser.

### Example
 
I'm actually using the script now to get a live update on modifying README.md! 

```console
./watch_vim.sh . README.md
```

### Why did I use monitoring on directory rather than the targeted file directly?

Because of vim. ifnotifyvim monitoring for specific events does not work on VIM simply because of VIM's way of handling files. When a file is modified, the inode of the file is changed, so ifnotifywait will actually listen to the old version of the file BEFORE the modification, while the new one is at a different address and will not be monitored further.

Check https://github.com/notify-rs/notify/issues/113 for further explanation of the workaround.
