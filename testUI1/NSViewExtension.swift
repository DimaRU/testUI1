//
//  NSViewExtension.swift
//  testUI1
//
//  Created by Dmitriy Borovikov on 25.04.17.
//  Copyright © 2017 Dmitriy Borovikov. All rights reserved.
//

import Cocoa

extension NSView {
    var backgoundColor: NSColor {
        get {
            return NSColor(cgColor: (self.layer?.backgroundColor)!)!
        }
        set {
            self.layer?.backgroundColor = newValue.cgColor
        }
    }
}
