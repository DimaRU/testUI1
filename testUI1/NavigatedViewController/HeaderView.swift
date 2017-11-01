//
//  HeaderView.swift
//  testUI1
//
//  Created by Dmitriy Borovikov on 30.10.2017.
//  Copyright © 2017 Dmitriy Borovikov. All rights reserved.
//

import Cocoa

class HeaderView: NSView {

    @IBOutlet weak var leftButton: NSButton!
    @IBOutlet weak var rightButton: NSButton!
    @IBOutlet weak var headerLabel: NSTextField!
    @IBOutlet weak var rightButtonMenu: NSMenu!
    
    var viewController: NavigatedViewController!
//    override func draw(_ dirtyRect: NSRect) {
//        super.draw(dirtyRect)
//
//        // Drawing code here.
//    }
//    
    @IBAction func leftButtonPress(_ sender: NSButton) {
        viewController.dismiss(sender)
    }

    @IBAction func rightButtonPress(_ sender: NSButton) {
        let p = NSPoint(x: 0, y: sender.frame.height)
        rightButtonMenu.popUp(positioning: nil, at: p, in: sender)
    }
}
