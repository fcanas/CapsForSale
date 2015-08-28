//
//  ViewController.swift
//  CapsForSale
//
//  Created by Fabian Canas on 8/28/15.
//  Copyright (c) 2015 Fabian Canas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var hatTable :UITableView?
    
    var hats :[Hat] = [] {
        didSet {
            hatTable?.reloadData()
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Hats"
        
        Hat.query()?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            if let returnedHats = objects as? [Hat] {
                self.hats = returnedHats
                self.navigationItem.title = "\(returnedHats.count) Hats"
            }
        })
    }
    
    @IBAction func newHat(sender :AnyObject) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

