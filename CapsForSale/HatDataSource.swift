//
//  HatDataSource.swift
//  CapsForSale
//
//  Created by Fabian Canas on 8/28/15.
//  Copyright (c) 2015 Fabian Canas. All rights reserved.
//

import UIKit

class HatDataSource: NSObject, UITableViewDataSource {
    
    var hats :[Hat] = []
    
    func fetchHats(completion :(success :Bool)->Void) {
        Hat.query()?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            if let returnedHats = objects as? [Hat] {
                self.hats = returnedHats
                completion(success: true)
            }
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hats.count
    }
    
    let CellID = "HatCellID"
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellID) as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: CellID)
        
        cell.textLabel?.text = hats[indexPath.row].text
        
        return cell
    }

}
