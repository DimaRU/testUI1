//
//  ViewController.swift
//  testUI1
//
//  Created by Dmitriy Borovikov on 21.04.17.
//  Copyright © 2017 Dmitriy Borovikov. All rights reserved.
//

import Cocoa

class ViewNavigator: NSViewController {
    
    @IBOutlet weak var leftButton: NSButton!
    @IBOutlet weak var rightButton: NSButton!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet var buttonMenu: NSMenu!
    @IBOutlet weak var containerView: NSView!
    
    var batTile: String? {
        didSet {
            titleLabel.stringValue = batTile ?? ""
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.gray.cgColor
        
        rightButton.sendAction(on: NSEvent.EventTypeMask.leftMouseDown)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func printChildViews(parent: NSViewController, level: Int = 0) {
        let tab: String = String(repeating: "\t", count: level)
        for viewController in parent.childViewControllers {
            print(tab, viewController)
            printChildViews(parent: viewController, level: level + 1)
        }
    }
    
    func printResponderChain(responder: NSResponder?, level: Int = 0) {
        let tab: String = String(repeating: "\t", count: level)
        guard let responder = responder else {
            return
        }
        
        print(tab, responder)
        printResponderChain(responder: responder.nextResponder, level: level + 1)
    }
    
    @IBAction func leftButtonPress(_ sender: NSButton) {
        printChildViews(parent: self)
        printResponderChain(responder: self)

        var topPresented = childViewControllers.first?.presentedViewControllers?.first
        while(topPresented?.presentedViewControllers?.first != nil) {
            topPresented = topPresented?.presentedViewControllers?.first
        }
        topPresented?.dismiss(sender)
    }

    @IBAction func rightButtonPress(_ sender: NSButton) {
        let p = NSPoint(x: 0, y: sender.frame.height)
        buttonMenu.popUp(positioning: nil, at: p, in: sender)
    }
}

