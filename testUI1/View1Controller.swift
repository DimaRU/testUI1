//
//  View1Controller.swift
//  testUI1
//
//  Created by Dmitriy Borovikov on 22.04.17.
//  Copyright © 2017 Dmitriy Borovikov. All rights reserved.
//

import Cocoa


class View1Controller: NavigatedViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    let list: [Int] = Array(1...10)

    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cellView = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        cellView.textField?.stringValue = "Line \(list[row])"

        return cellView
    }

    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }

        print("Selected: ", tableView.selectedRow)
        self.performSegue(withIdentifier: NSStoryboardSegue.Identifier(rawValue: "rowdetail"), sender: notification.object)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier!.rawValue == "rowdetail" {
            let destinationController = segue.destinationController as! View2Controller
            destinationController.delegate = self
        }
    }
    
}
