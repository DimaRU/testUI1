//
//  NavigetedViewController.swift
//  testUI1
//
//  Created by Dmitriy Borovikov on 24.04.17.
//  Copyright © 2017 Dmitriy Borovikov. All rights reserved.
//

import Cocoa

class NavigatedViewController: NSViewController {

    var navigator: ViewNavigator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let navigator = NSApplication.shared.windows.first?.contentViewController as? ViewNavigator {
            self.navigator = navigator
        }
        view.wantsLayer = true
    }
    
    override func presentViewController(_ viewController: NSViewController, animator: NSViewControllerPresentationAnimator) {
        super.presentViewController(viewController, animator: animator)
        if let navigator = NSApplication.shared.windows.first?.contentViewController as? ViewNavigator {
            navigator.leftButton.isHidden = self.navigator?.childViewControllers.first?.presentedViewControllers?.first == nil
        }
        if viewController.parent == nil {
            addChildViewController(viewController)
        }
        print("present:", viewController)
    }
    
    override func dismiss(_ sender: Any?) {
        super.dismiss(sender)
        navigator?.leftButton.isHidden = navigator?.childViewControllers.first?.presentedViewControllers?.first == nil
        
        removeFromParentViewController()
    }
    
}
