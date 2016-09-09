//
//  FiltersTVC.swift
//  Ultimate AdBlock
//
//  Created by Eric Horstmanshof on 29-11-15.
//  Copyright © 2015 Arrow Webprojects. All rights reserved.
//

import UIKit

class FiltersTVC: UITableViewController {
    
    var adsCell: UITableViewCell = UITableViewCell()
    var trackersCell: UITableViewCell = UITableViewCell()
    var shareCell: UITableViewCell = UITableViewCell()
    
    struct Filter{
        var hostName: NSString
    }
    
    var tableViewItems = [Filter]()
    var filteredTableViewItems = [Filter]()

    // MARK: - View Controller LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = NSLocalizedString("NAVBAR_FILTERS", comment: "")
        
        adsCell.textLabel?.text = NSLocalizedString("FILTERS_ADS", comment: "")
        trackersCell.textLabel?.text = NSLocalizedString("FILTERS_TRACKERS", comment: "")
        shareCell.textLabel?.text = NSLocalizedString("FILTERS_SOCIAL_WIDGETS", comment: "")
        
        adsCell.accessoryType = .disclosureIndicator
        trackersCell.accessoryType = .disclosureIndicator
        shareCell.accessoryType = .disclosureIndicator
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch (section) {
            
        case 0: return NSLocalizedString("TABLEVIEW_HEADER_TITLE_FILTERS_PREINSTALLED", comment: "")
        default: fatalError()
            
        }
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("Filter", forIndexPath: indexPath)

        //cell.textLabel?.text = tableViewItems[indexPath.row].hostName as String

        //return cell
        
        switch((indexPath as NSIndexPath).section) {
            
        case 0:
            switch((indexPath as NSIndexPath).row) {
            case 0: return self.adsCell
            case 1: return self.trackersCell
            case 2: return self.shareCell
            default: fatalError()
            }
        default: fatalError()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if ((indexPath as NSIndexPath).section == 0) {
            
            if ((indexPath as NSIndexPath).row == 0) {
                
                self.performSegue(withIdentifier: "Filters Ads", sender: self)
                
            }
            
            if ((indexPath as NSIndexPath).row == 1) {
                
                self.performSegue(withIdentifier: "Filters Trackers", sender: self)
                
            }
            
            if ((indexPath as NSIndexPath).row == 2) {
                
                self.performSegue(withIdentifier: "Filters Social", sender: self)
                
            }
            
        }
    }

}
