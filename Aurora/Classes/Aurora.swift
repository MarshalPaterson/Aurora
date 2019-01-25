//
//  Aurora.swift
//  Aurora
//
//  Created by Marshal Paterson on 10/9/18.
//  Copyright © 2018 Open Search Project. All rights reserved.
//

import Foundation

open class Aurora {
    
    internal var listeners = Dictionary<String, (Any?) -> ()>()
    
    public static let shared = Aurora()
    
    open func addListener(name: String, callback: @escaping (Any?) -> ()) {
        let newListener = AuroraObject(name: name, callback: callback)
        let keyExists = listeners[newListener.name] != nil
        
        if !keyExists {
            listeners[newListener.name] = newListener.callback
        } else {
            print("Aurora has this listener already set.")
        }
    }
    
    open func removeListener (name: String) {
        listeners.removeValue(forKey: name)
    }
    
    open func dispatch(name:String, data:Any? = nil) {
        let d = listeners[name]
        d!(data)
    }
    
}

public class AuroraEvent {
    
    var name:String = ""
    var data:Any? = []
    
    init(name:String, data:Any?) {
        self.name = name
        self.data = data
    }
}

internal struct AuroraObject {
    let name:String
    var callback: ((Any?) -> ())
}
