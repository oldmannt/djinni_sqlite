//
//  ViewController.swift
//  djinni_sqlite
//
//  Created by dyno on 5/14/16.
//  Copyright © 2016 dyno. All rights reserved.
//

import UIKit
import djinni_sqlite_objc

class ViewController: UIViewController {

    var logger_obj:DSMyClientInterfaceSW?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        logger_obj = DSMyClientInterfaceSW()
        DSTodoList.setLogger(logger_obj)
        
        var todo_list = DSTodoList.createWithPath("fire")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

