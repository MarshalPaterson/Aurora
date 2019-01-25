//
//  Aurora.swift
//  Aurora
//
//  Created by Marshal Paterson on 10/9/18.
//  Copyright © 2018 Open Search Project. All rights reserved.
//

import Foundation

//public protocol AuroraProtocol {
//    func sharedInstance()
//}

open class Aurora {
    
    internal var listeners = Dictionary<String, (Any?) -> ()>()
    
    public static let shared = Aurora()

    open func addListener(name: String, callback: @escaping (Any?) -> ()) {
        let newListener = AuroraObject(name: name, callback: callback)
        listeners[newListener.name] = newListener.callback
    }
    
    public func removeListener (name: String) {
        listeners.removeValue(forKey: name)
    }
    
    public func dispatch(name:String, data:Any? = nil) {
        let d = listeners[name]
        d!(data)
    }
    
    public func goto() {
        
    }
    
    public func session() {
        
    }
    
    public func addService() {
        
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

