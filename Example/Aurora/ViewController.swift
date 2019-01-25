//
//  ViewController.swift
//  Aurora
//
//  Created by marshal.paterson on 09/11/2018.
//  Copyright (c) 2018 marshal.paterson. All rights reserved.
//

import UIKit
import Aurora

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Aurora.shared.addListener(name: "newAurora", callback: handler)
        Aurora.shared.dispatch(name: "newAurora", data: "New Data")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handler(data : Any?) {
        print(data!)
    }

}

