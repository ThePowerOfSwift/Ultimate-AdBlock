# Ultimate-AdBlock for Safari
Ad + Tracker (Content) Blocker for iOS & OSX written in Swift, using the new Content Blocker API for fast blocking.
Blocks hostnames and hides CSS Ads Elements. The project is in active development.

## Content Blocker API VS JavaScript Blockers
We all know them, the browser extensions that block ads and trackers. Some of them are fast and most of them use massive amounts of memory to block everything. 
The more lists you subscribe to, the slower the browser is. You may have seen it in the statusbar when loading a webpage: "Waiting for extension *name*".
These lists are created in the last decade and contain elements that were found on some webpage at some point. There are also duplicate items for multiple websites and items.
This list is refreshed automagically (~ every week). The browser extension makes a network connection, downloads the new list and stores it without you knowing it.
While this is fine for most users and has been for the last decade, there must be a better and faster way to protect your privacy.

Thankfully Apple has created a new Content Blocker API for Safari (iOS & OSX).

The goal of this extension is the following:

- Never make a network connection
- Never send (anonymous) usage statistics
- Block most advertisements and trackers
- Don't slow down the page

The extensions never makes any network connection. The only way to update the filters is to update the extension itself, and that's fine.
The complete blockerList.json consists of JSON rules that are delivered to Safari. For more info, please check "About the Safari Content Blocker API" below.

## Filters
Ultimate AdBlock uses a couple of filters;

### Hostnames
- [pgl.yoyo.org Adserver hostnames](https://pgl.yoyo.org/adservers/), updated 16 April 2016
- [EasyList Blocklist (Section: Third-party advertisers)](https://easylist-downloads.adblockplus.org/easylist.txt), updated 16 April 2016
- [EasyList Privacy (Section: Third-party tracking domains)](https://easylist-downloads.adblockplus.org/easyprivacy.txt), updated 25 April 2016
- [Malwaredomains](http://mirror1.malwaredomains.com), updated 19 April 2016
- Custom hostnames, updated 10 April 2016

### CSS Element Hiding
- [Fanboys Social Blocklist (Section: General Element Hiding Rules)](https://easylist-downloads.adblockplus.org/fanboy-social.txt), updated 10 April 2016
- [EasyList Blocklist (Section: General Element Hiding Rules)](https://easylist-downloads.adblockplus.org/easylist.txt), updated 10 April 2016
- Custom Anti AdBlock CSS elements, updated 10 April 2016
- Custom Ads CSS elements, updated 10 April 2016
- Custom Social sharing CSS elements, updated 10 April 2016
- Javascript files, updated 10 April 2016

All block data is stored in .txt files. Some have different formats. For example the pgl.yoyo adservers are all on one line, seperated with a comma.
The other filters are different. Every host is stored on a new line, for clarity.

By default all filters are enabled. If you want to disable a filter (for example the social css elements) you can do so by setting the correct variable in update-filters.swift to false.
Run the script again to generate fresh filters. Reloading the filters into (iOS) Safari (especially the hosts) can take up to 15 seconds.

### Number of filters (as of 25 April 2016)

#### Hostnames:
- yoyo.pgl.org AdServer: 2.413
- Easylist: 5.093
- Easylist Privacy: 2.602
- Malwaredomains: 19.062
- Custom: 75
- Whitelist: 2

Total number of Hostnames: 29.245

Duplicate hostnames removed: 976

Total Unique number of hostnames added to the blocklist: 28.269 / 50.000

Size of blockerList.json: 4.1 MB

#### CSS Elements Hiding & JavaScripts:
- CSS Elements (Custom) - Ads: 62
- CSS Elements (Custom) - Social: 21
- CSS Elements (Custom) - Anti AdBlock: 6
- CSS Elements - Ads EasyList: 16.318
- CSS Elements - Social Fanboys List: 6.705
- Javascript files: 29

Total: 23.141 / 50.000

Size of blockerList.json: 368 KB

### Whitelists
To add a website to your whitelist (so all the rules are ignored on this website) add your website to the whitelist.txt file with a * in front of the domain name. Then update the filters.

### Updating the block list
If you want to contribute and add a hostname of css element to the blocklist, please open a issue describing the hostname and which website is serving this hostname.

## ToDo
- Easylist Dutch
- Include OSX Safari extension
- iOS Interface to enable/disable filters
- Cleanup iOS app interface

## How to install

### iOS Safari

- Download the project
- Build the project on your device
- On your device go to Settings -> Safari -> Content Blockers
- Enable the Hosts and CSS Element Hiding Blocker
- Enjoy a cleaner web with no annoying ads and trackers!

This Content Blocking API is only available on 64 bit devices (iPhone 5s and newer, iPad Air and newer)

### OSX Safari
(Manual method, for now)
- Open up the Safari Extension Builder from the Developer Menu.
- Create a new extension
- Copy the blockerList.json Hosts into the Extension folder you just created.
- Load this blockerList.json into the Content Blocker dropdown menu.
- Install the extension.
- Optional: Do the same for the CSS blockerList.json.

## How to update the filters

Updating the blocking filters is easy:

- Update the filters in the folder BlockData
- Enable/Disable filters as you wish
- CD TO /path/to/update-filters.swift in your terminal.
- Run script: /usr/bin/swift update-filters.swift

Both blockerList.json (UltimateAdBlock-Hosts & UltimateAdBlock-CSS) are now updated with the latest block data. Open the app on your iOS device to refresh the new filters into Safari.

## Contribute

If you want to contribute to this project please consider opening an issue of a pull request!

## About the Safari Content Blocker API

For more info about this awesome API please check;

- [https://developer.apple.com/videos/play/wwdc2015/511/](https://developer.apple.com/videos/play/wwdc2015/511/) - WWDC 2015 session
- [https://webkit.org/blog/3476/content-blockers-first-look/](https://webkit.org/blog/3476/content-blockers-first-look/) - Introduction to WebKit Content Blockers, First Look

## License
The MIT License (MIT)

Copyright (c) 2016 Eric Horstmanshof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.