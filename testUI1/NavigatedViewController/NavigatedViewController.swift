//
//  NavigetedViewController.swift
//  testUI1
//
//  Created by Dmitriy Borovikov on 24.04.17.
//  Copyright © 2017 Dmitriy Borovikov. All rights reserved.
//

import Cocoa

class NavigatedViewController: NSViewController {

    var headerView: HeaderView!
    var footerView: FooterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView = .fromNib()
        footerView = .fromNib()
        headerView.viewController = self
        
        addHeaderFooter()
        view.wantsLayer = true
    }
    
    func addHeaderFooter() {
        print(view.subviews.count)
        for subview in view.subviews {
            print(String(describing: subview.self))
        }
        assert(view.subviews.count == 1, "subviews.count > 1")
        
        let subview = view.subviews.first!
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.translatesAutoresizingMaskIntoConstraints = false
        subview.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(footerView)
        view.addSubview(headerView)
    
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        subview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        subview.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: footerView.topAnchor).isActive = true
    }
    
    

//    override func presentViewController(_ viewController: NSViewController, animator: NSViewControllerPresentationAnimator) {
//        super.presentViewController(viewController, animator: animator)
//        if let navigator = NSApplication.shared.windows.first?.contentViewController as? ViewNavigator {
//            navigator.leftButton.isHidden = self.navigator?.childViewControllers.first?.presentedViewControllers?.first == nil
//        }
//        if viewController.parent == nil {
//            addChildViewController(viewController)
//        }
//        print("present:", viewController)
//    }
//
//    override func dismiss(_ sender: Any?) {
//        super.dismiss(sender)
//        headerView.leftButton.isHidden = navigator?.childViewControllers.first?.presentedViewControllers?.first == nil
//
//        removeFromParentViewController()
//    }
    
}
