//
//  View3Controller.swift
//  testUI1
//
//  Created by Dmitriy Borovikov on 22.04.17.
//  Copyright © 2017 Dmitriy Borovikov. All rights reserved.
//

import Cocoa

class View3Controller: NavigatedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.blue.cgColor
//        navigator?.barTitle = "Detail"
    }
    
}
