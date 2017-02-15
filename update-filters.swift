//
//  update-filters.swift
//  Ultimate AdBlock
//
//  Created by Eric Horstmanshof on 29-11-15.
//  Copyright © 2015 Arrow Webprojects. All rights reserved.
//

import Foundation

// update-filters.swift file to update the adblocking filters used by the application.
// There is an already available hosts list available and you can add custom ones.
//
//

// HOWTO: Update the filters
//
// CD TO /path/to/update-filters.swift
// RUN AS: /usr/bin/swift update-filters.swift
// filters.json in the AdBlockerExtension is now updated.
// Restart or run the app on your device to get the newest filters.

print("------------------")
print("Started generating the filters.json file.")

// MARK: Enabled/Disabled per filter

// Default pgl.yoyo adservers
let adServerHostnamesEnabled = true

// Easylist adservers
var easylist_adserversEnabled = true

// easyprivacy
let easyprivacyEnabled = true

// Custom hostnames
let customHostnamesEnabled = true

// Whitelist hostnames
var whitelistEnabled = true

// End hostnames

// CSS Elements Anti AdBlock
let antiAdBlockElementsEnabled = true

// CSS Elements Ads
let cssElementsAdsEnabled = true

// CSS Elements Ads Easylist
let cssElementsAdsEasyListEnabled = true

// CSS Elements Social
let cssElementsSocialEnabled = true

// CSS Elements Social from the fanboy list
let cssElementsSocialFanboyEnabled = true

// Javascript elements
let javascriptElementsEnabled = true

// Complete filters json block
var blockerListHosts = [AnyObject]()
var blockerListCssElements = [AnyObject]()

// The start time
let start = NSDate()

// Complete array of all the hostnames that are going to be blocked.
var hostnamesToBlock = [String]()

// MARK: FILTER: Default yoyo adservers
// pgl.yoyo adservers
// !!!
// All credit for these hostnames: https://pgl.yoyo.org/adservers/
// !!!
let adServerHostnamesFile = "BlockData/yoyo-adservers.txt"
var adServerHostnamesCount = 0

if adServerHostnamesEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: adServerHostnamesFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            let hosts = contents.components(separatedBy: ",")
            adServerHostnamesCount = hosts.count
            
            for host in hosts {
                hostnamesToBlock.append(host)
            }
            
        }
        
    } catch {
        print("Can't read the \(adServerHostnamesFile) file.")
    }
    
}

// Easylist
//!---------------------------Third-party advertisers---------------------------!
//! *** easylist:easylist/easylist_adservers.txt ***
// !!!
// All credit for these hostnames: https://easylist-downloads.adblockplus.org/easylist.txt
// !!!
let easylist_adserversFile = "BlockData/easylist_adservers.txt"
var easylist_adserversCount = 0

if easylist_adserversEnabled == true {
    
    do {
        
        let contents = try NSString(contentsOfFile: easylist_adserversFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            let hosts = contents.components(separatedBy: NSCharacterSet.newlines)
            easylist_adserversCount = hosts.count
            
            for host in hosts {
                
                if host.range(of: "||") != nil{
                    
                    var trimmedHost = host
                    
                    trimmedHost = trimmedHost.replacingOccurrences(of: "||", with: "")
                    
                    // Remove all special characters so all that remains are the hosts
                    if let dotRange = trimmedHost.range(of: "^") {
                        trimmedHost.removeSubrange(dotRange.lowerBound..<trimmedHost.endIndex)
                    }
                    
                    if let dotRange = trimmedHost.range(of: "$") {
                        trimmedHost.removeSubrange(dotRange.lowerBound..<trimmedHost.endIndex)
                    }
                    
                    if let dotRange = trimmedHost.range(of: "*") {
                        trimmedHost.removeSubrange(dotRange.lowerBound..<trimmedHost.endIndex)
                    }
                    
                    if let dotRange = trimmedHost.range(of: "?") {
                        trimmedHost.removeSubrange(dotRange.lowerBound..<trimmedHost.endIndex)
                    }

                    if let dotRange = trimmedHost.range(of: "/") {
                        trimmedHost.removeSubrange(dotRange.lowerBound..<trimmedHost.endIndex)
                    }
                    
                    hostnamesToBlock.append(trimmedHost)
                    
                }
            }
            
        }
        
    } catch {
        print("Can't read the \(easylist_adserversFile) file.")
    }
    
}


// MARK: FILTER: Easy Privacy List
 
// Easy Privacy hostnames
// !!!
// All Credit to: https://easylist-downloads.adblockplus.org/easyprivacy.txt
// URL:
// !!!
var easyprivacyFile = "BlockData/easyprivacy.txt"
var easyprivacyCount = 0

if easyprivacyEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: easyprivacyFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            let hosts = contents.components(separatedBy: NSCharacterSet.newlines)
            easyprivacyCount = hosts.count
            
            for host in hosts {
                
                if host.range(of: "||") != nil{
                    
                    var trimmedHost = host
                    
                    trimmedHost = trimmedHost.replacingOccurrences(of: "||", with: "")
                    
                    // Remove all special characters so all that remains are the hosts
                    if let dotRange = trimmedHost.range(of: "^") {
                        trimmedHost.removeSubrange(dotRange.lowerBound..<trimmedHost.endIndex)
                    }
                    
                    if let dotRange = trimmedHost.range(of: "$") {
                        trimmedHost.removeSubrange(dotRange.lowerBound..<trimmedHost.endIndex)
                    }
                    
                    if let dotRange = trimmedHost.range(of: "*") {
                        trimmedHost.removeSubrange(dotRange.lowerBound..<trimmedHost.endIndex)
                    }
                    
                    if let dotRange = trimmedHost.range(of: "?") {
                        trimmedHost.removeSubrange(dotRange.lowerBound..<trimmedHost.endIndex)
                    }
                    
                    if let dotRange = trimmedHost.range(of: "/") {
                        trimmedHost.removeSubrange(dotRange.lowerBound..<trimmedHost.endIndex)
                    }
                    
                    hostnamesToBlock.append(trimmedHost)
                    
                }
            }
            
        }
        
    } catch {
        print("Can't read the \(easyprivacyFile) file.")
    }
    
}

// MARK: FILTER: Custom Hostnames
// Custom hostnames to block
let customHostnamesFile = "BlockData/custom-hostnames.txt"
var customHostnamesCount = 0

if customHostnamesEnabled == true {
    
    do {
        
        let contents = try NSString(contentsOfFile: customHostnamesFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            let hosts = contents.components(separatedBy: NSCharacterSet.newlines)
            customHostnamesCount = hosts.count
            
            for host in hosts {
                if host.characters.count > 0 {
                    hostnamesToBlock.append(host)
                }
            }
            
        }
        
    } catch {
        print("Can't read the \(customHostnamesFile) file.")
    }
}

// MARK: FILTER: Whitelist hostnames
// Whitelist websites to ignore all previous rules.
var whitelistHostnames = [String]()
let whitelistFile = "BlockData/whitelist.txt"
var whitelistCount = 0

if whitelistEnabled == true {
    
    do {
        
        let contents = try NSString(contentsOfFile: whitelistFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            let hosts = contents.components(separatedBy: NSCharacterSet.newlines)
            whitelistCount = hosts.count
            
            for host in hosts {
                if host.characters.count > 0 {
                    whitelistHostnames.append(host)
                }
            }
            
        }
        
    } catch {
        print("Can't read the \(whitelistFile) file.")
    }
}

// MARK: FILTER: Anti Adblock Elements
// Remove Anti AdBlock CSS elements
var antiAdBlockElements: String = ""
let antiAdBlockElementsFile = "BlockData/custom-css-elements-antiadblock.txt"

if antiAdBlockElementsEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: antiAdBlockElementsFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            antiAdBlockElements = (contents as NSString).replacingOccurrences(of: "\n", with: ",")
        
        }
    } catch {
        print("Can't read the \(antiAdBlockElementsFile) file.")
    }
    
}

// MARK: FILTER: CSS Elements Ads
// Remove CSS Elements for ads
var cssElementsAds: String = ""
let cssElementsAdsFile = "BlockData/custom-css-elements-ads.txt"

if cssElementsAdsEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: cssElementsAdsFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {

            cssElementsAds = (contents as NSString).replacingOccurrences(of: "\n", with: ",")
            
        }
        
    } catch {
        print("Can't read the \(cssElementsAdsFile) file.")
    }
    
}

// MARK: FILTER: CSS Element Social
// Remove CSS Elements for social buttons
var cssElementsSocial: String = ""
let cssElementsSocialFile = "BlockData/custom-css-elements-social.txt"

if cssElementsSocialEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: cssElementsSocialFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
        
            cssElementsSocial = (contents as NSString).replacingOccurrences(of: "\n", with: ",")
            
        }
        
    } catch {
        print("Can't read the \(cssElementsSocialFile) file.")
    }
    
}

// MARK: FILTER: CSS Elements Social Fanboy
// Remove CSS Elements for social buttons
// !!!
// All credit for this data: https://easylist-downloads.adblockplus.org/fanboy-social.txt
// Section: General element hiding rules
// URL:
// !!!

var cssElementsSocialFanboy: String = ""
let cssElementsSocialFanboyFile = "BlockData/fanboys-social-blocking-list.txt"

if cssElementsSocialFanboyEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: cssElementsSocialFanboyFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            cssElementsSocialFanboy = (contents as NSString).replacingOccurrences(of: "\n", with: ",")
            cssElementsSocialFanboy = (cssElementsSocialFanboy as NSString).replacingOccurrences(of: "###", with: "#")
            cssElementsSocialFanboy = (cssElementsSocialFanboy as NSString).replacingOccurrences(of: "##.", with: ".")
            
        }
        
    } catch {
        print("Can't read the \(cssElementsSocialFanboyFile) file.")
    }
    
}

// MARK: FILTER: CSS Elements Easylist
// Remove CSS Elements for ads
// !!!
// All credit for this data: https://easylist-downloads.adblockplus.org/easylist.txt
// Section: General element hiding rules
// URL:
// !!!

var cssElementsAdsEasyList: String = ""
let cssElementsAdsEasyListFile = "BlockData/css-elements-ads-easylist.txt"

if cssElementsAdsEasyListEnabled == true {
    
    do {
        
        let contents = try NSString(contentsOfFile: cssElementsAdsEasyListFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            cssElementsAdsEasyList = (contents as NSString).replacingOccurrences(of: "\n", with: ",")
            cssElementsAdsEasyList = (cssElementsAdsEasyList as NSString).replacingOccurrences(of: "###", with: "#")
            cssElementsAdsEasyList = (cssElementsAdsEasyList as NSString).replacingOccurrences(of: "##.", with: ".")
            
        }
        
    } catch {
        print("Can't read the \(cssElementsAdsEasyListFile) file.")
    }
    
}

// MARK: FILTER: Javascripts
// Block the following javascripts
var javascriptElements = [String]()
let javascriptElementsFile = "BlockData/javascripts.txt"

if javascriptElementsEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: javascriptElementsFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            javascriptElements = contents.components(separatedBy: NSCharacterSet.newlines)
            
        }
        
    } catch {
        print("Can't read the \(javascriptElementsFile) file.")
    }
    
}

// Statistics

let cssElementsAdsCount = cssElementsAds.components(separatedBy: ",").count
let cssElementsAdsEasyListCount = cssElementsAdsEasyList.components(separatedBy: ",").count
let cssElementsSocialCount = cssElementsSocial.components(separatedBy: ",").count
let antiAdBlockElementsCount = antiAdBlockElements.components(separatedBy: ",").count
let cssElementsSocialFanboyCount = cssElementsSocialFanboy.components(separatedBy: ",").count

let javascriptElementsCount = javascriptElements.count

// MARK: Iterating over the filters and add them to the blockList array.

var numberFormatter = NumberFormatter()
numberFormatter.numberStyle = NumberFormatter.Style.decimal

print("")
print("-- Hostnames:")
print("yoyo.pgl.org AdServer: \(numberFormatter.string(from: NSNumber(value: adServerHostnamesCount))!)")
print("Easylist: \(numberFormatter.string(from: NSNumber(value: easylist_adserversCount))!)")
print("Easylist Privacy: \(numberFormatter.string(from: NSNumber(value: easyprivacyCount))!)")
print("Custom: \(numberFormatter.string(from: NSNumber(value: customHostnamesCount))!)")
print("Whitelist: \(numberFormatter.string(from: NSNumber(value: whitelistCount))!)")

let totalHostnamesToBlock = adServerHostnamesCount + easylist_adserversCount + easyprivacyCount + customHostnamesCount
let totalHostnamesToBlockUnique = Array(Set(hostnamesToBlock)).count

print("")
print("Total number of Hostnames: \(numberFormatter.string(from: NSNumber(value: totalHostnamesToBlock))!)")
print("Duplicate hostnames removed: \(totalHostnamesToBlock - totalHostnamesToBlockUnique)")
print("Total Unique number of hostnames added to the blocklist: \(numberFormatter.string(from: NSNumber(value: totalHostnamesToBlockUnique))!) / 50.000")

print("")
print("-- CSS Elements Hiding & JavaScripts:")
print("CSS Elements (Custom) - Anti AdBlock: \(numberFormatter.string(from: NSNumber(value: antiAdBlockElementsCount))!)")
print("CSS Elements (Custom) - Ads: \(numberFormatter.string(from: NSNumber(value: cssElementsAdsCount))!)")
print("CSS Elements (Custom) - Social: \(numberFormatter.string(from: NSNumber(value: cssElementsSocialCount))!)")
print("CSS Elements - Ads EasyList: \(numberFormatter.string(from: NSNumber(value: cssElementsAdsEasyListCount))!)")
print("CSS Elements - Social Fanboys List: \(numberFormatter.string(from: NSNumber(value: cssElementsSocialFanboyCount))!)")
print("Javascript files: \(numberFormatter.string(from: NSNumber(value: javascriptElementsCount))!)")
print("")

let totalCSSElementsToBlock = cssElementsAdsCount + cssElementsAdsEasyListCount + cssElementsSocialCount + antiAdBlockElementsCount + cssElementsSocialFanboyCount + javascriptElementsCount

print("Total: \(numberFormatter.string(from: NSNumber(value: totalCSSElementsToBlock))!) / 50.000")
print("")

// Iterate over every hostname and add it to the block list.
for host in hostnamesToBlock {
    let block = ["trigger" : ["url-filter" : "^https?:/+([^/:]+\\.)?\(String(host)!)[:/]", "load-type" : ["third-party"] ], "action" : [ "type" : "block" ] ]
    blockerListHosts.append(block as AnyObject)
}

// Anti Adblock Elements
let antiAdBlockElementsBlock = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(antiAdBlockElements)" ] ]
blockerListCssElements.append(antiAdBlockElementsBlock as AnyObject)

// Ads CSS Elements
let cssElementsAdsBlock = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssElementsAds)" ] ]
blockerListCssElements.append(cssElementsAdsBlock as AnyObject)

// Ads CSS Elements EasyList
let cssElementsAdsEasyListBlock = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssElementsAdsEasyList)" ] ]
blockerListCssElements.append(cssElementsAdsEasyListBlock as AnyObject)

// Social CSS Elements
let cssElementsSocialBlock = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssElementsSocial)" ] ]
blockerListCssElements.append(cssElementsSocialBlock as AnyObject)

// Social CSS Elements Fanboy List
let cssElementsSocialFanboyBlock = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssElementsSocialFanboy)" ] ]
blockerListCssElements.append(cssElementsSocialFanboyBlock as AnyObject)

// Javascripts
for javascriptElement in javascriptElements {
    let javascriptElementBlock = ["trigger" : ["url-filter" : "\(javascriptElement)" ], "action" : [ "type" : "block" ] ]
    blockerListCssElements.append(javascriptElementBlock as AnyObject)
}

// Whitelist hostnames
if whitelistCount > 0 {
    let block = ["trigger" : ["url-filter" : ".*", "if-domain" : whitelistHostnames ], "action" : [ "type" : "ignore-previous-rules" ] ]
    blockerListHosts.append(block as AnyObject)
    blockerListCssElements.append(block as AnyObject)
}

// MARK: Generate json file.
// Parse the JSON and write it to a file.
print("Generating blockerList json files..")

// Hosts
let dataHosts = try! JSONSerialization.data(withJSONObject: blockerListHosts, options: JSONSerialization.WritingOptions.prettyPrinted)
let stringHosts = NSString(data: dataHosts, encoding: String.Encoding.utf8.rawValue)

do {
    try stringHosts!.write(toFile: "UltimateAdBlock-Hosts/blockerList.json", atomically: false, encoding: String.Encoding.utf8.rawValue)
}
catch {
    print("Extension Writing Error: \(error)")
}

// CSS
let dataCSS = try! JSONSerialization.data(withJSONObject: blockerListCssElements, options: JSONSerialization.WritingOptions.prettyPrinted)
let stringCSS = NSString(data: dataCSS, encoding: String.Encoding.utf8.rawValue)

do {
    try stringCSS!.write(toFile: "UltimateAdBlock-CSS/blockerList.json", atomically: false, encoding: String.Encoding.utf8.rawValue)
}
catch {
    print("Extension Writing Error: \(error)")
}

let end = NSDate()
let timeInterval: Double = end.timeIntervalSince(start as Date)

print("All done! blockerList.json for Hosts and CSS Elements has been updated in \(String(format: "%.2f", timeInterval)) seconds.")
print("Build & Restart the app on the device to load the new filters into Safari.")
print("------------------")
