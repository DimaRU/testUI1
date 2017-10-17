//
//  CrossfadeStoryboardSegue.swift
//  View Controller Transition Demo
//
//  Created by John Marstall on 3/20/15.
//  Copyright (c) 2015 John Marstall. All rights reserved.
//

import Cocoa

class CrossfadeStoryboard: NSStoryboardSegue {
    
    // make references to the source controller and destination controller
    override init(identifier: NSStoryboardSegue.Identifier,
        source sourceController: Any,
        destination destinationController: Any) {
            super.init(identifier: identifier, source: sourceController, destination: destinationController)
    }
    
    
    override func perform() {
        
        // build from-to and parent-child view controller relationships
        let sourceViewController  = self.sourceController as! NSViewController
        let destinationViewController = self.destinationController as! NSViewController
        let containerViewController = sourceViewController.parent! as NSViewController
        
        // add destinationViewController as child
        containerViewController.insertChildViewController(destinationViewController, at: 1)
        
        // get the size of destinationViewController
        let targetSize = sourceViewController.view.frame.size
        
        // prepare for animation
        sourceViewController.view.wantsLayer = true
        destinationViewController.view.wantsLayer = true
        
        //perform transition
        containerViewController.transition(from: sourceViewController, to: destinationViewController, options: NSViewController.TransitionOptions.slideLeft, completionHandler: nil)
        
        //resize view controllers
        sourceViewController.view.animator().setFrameSize(targetSize)
        destinationViewController.view.animator().setFrameSize(targetSize)

        // lose the sourceViewController, it's no longer visible
        containerViewController.removeChildViewController(at: 0)
    }
    
    
}

