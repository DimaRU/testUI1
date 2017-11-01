//
//  View2Controller.swift
//  testUI1
//
//  Created by Dmitriy Borovikov on 22.04.17.
//  Copyright © 2017 Dmitriy Borovikov. All rights reserved.
//

import Cocoa

class View2Controller: NavigatedViewController {

    var delegate: View1Controller!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.green.cgColor
//        navigator?.barTitle = "Row \(delegate.tableView.selectedRow)"
    }
    
    override func viewWillAppear() {
//        navigator?.barTitle = "Row \(delegate.tableView.selectedRow)"
    }
}
