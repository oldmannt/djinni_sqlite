//
//  DSMyClientInterfaceSW.swift
//  libdjinni_sqlite
//
//  Created by dyno on 5/15/16.
//
//

import Foundation

class DSMyClientInterfaceSW:DSMyClientInterface{
    @objc func logString(str: String) -> Bool{
        print("DSMyClientInterface \(str)")
        return true
    }
}