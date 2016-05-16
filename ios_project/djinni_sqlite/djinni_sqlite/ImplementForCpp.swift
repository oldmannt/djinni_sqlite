//
//  ImplementForCpp.swift
//  djinni_sqlite
//
//  Created by dyno on 5/14/16.
//  Copyright © 2016 dyno. All rights reserved.
//

import Foundation

class ImplementForCpp:DSMyClientInterface{
    @objc func logString(str: String) -> Bool{
        print("DSMyClientInterface \(str)")
        return true
    }
}