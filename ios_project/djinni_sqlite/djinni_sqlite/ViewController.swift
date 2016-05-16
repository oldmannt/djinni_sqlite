//
//  ViewController.swift
//  djinni_sqlite
//
//  Created by dyno on 5/14/16.
//  Copyright © 2016 dyno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var logger_obj:ImplementForCpp?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        logger_obj = ImplementForCpp()
        DSTodoList.setLogger(logger_obj)
        
        var todo_list = DSTodoList.createWithPath("fire")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

