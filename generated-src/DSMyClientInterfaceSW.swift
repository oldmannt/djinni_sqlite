//
//  DSMyClientInterfaceSW.swift
//  libdjinni_sqlite
//
//  Created by dyno on 5/15/16.
//
//

import Foundation

public
class DSMyClientInterfaceSW:DSMyClientInterface{
    public init(){
        
    }
    @objc public func logString(str: String) -> Bool{
        print("DSMyClientInterface \(str)")
        return true
    }
}