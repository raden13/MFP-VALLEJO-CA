//
//  AboutViewController.swift
//  MFP-Vallejo
//
//  Created by Arend Pryor on 3/16/16.
//  Copyright © 2016 RadenDesigns. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    var viewController = ViewController!()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func aboutBackBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
