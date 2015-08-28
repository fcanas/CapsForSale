//
//  ViewController.swift
//  CapsForSale
//
//  Created by Fabian Canas on 8/28/15.
//  Copyright (c) 2015 Fabian Canas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var hatTable :UITableView = UITableView(frame: CGRectZero, style: .Plain)
    
    let dataSource :HatDataSource = HatDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(hatTable)
        
        hatTable.frame = view.bounds
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "newHat")
        
        hatTable.dataSource = dataSource
        navigationItem.title = "Hats"
    }
    
    func newHat() {
        presentViewController(UINavigationController(rootViewController: NewHatViewController()), animated: true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        dataSource.fetchHats({ (success) -> Void in
            self.hatTable.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

