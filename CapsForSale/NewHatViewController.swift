//
//  NewHatViewController.swift
//  CapsForSale
//
//  Created by Fabian Canas on 8/28/15.
//  Copyright (c) 2015 Fabian Canas. All rights reserved.
//

import UIKit

class NewHatViewController: UIViewController {

    @IBOutlet var hatTextField :UITextField?
    
    @IBAction func save(sender :AnyObject) {
        let newHat = Hat()
        newHat.text = hatTextField?.text
        newHat.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
            } else {
                let alert = UIAlertController(title: "No hat", message: "There was a problem making your hat", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancel(sender :AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
