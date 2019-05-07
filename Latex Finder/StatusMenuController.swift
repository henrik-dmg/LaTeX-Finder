//
//  StatusMenuController.swift
//  Latex Finder
//
//  Created by Henrik Panhans on 01.05.19.
//  Copyright © 2019 Henrik Panhans. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {

    @IBOutlet weak var searchView: SearchController!
    @IBOutlet weak var menu: NSMenu!
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    var searchItem: NSMenuItem!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        menu.delegate = self
        
        statusItem.button?.image = NSImage(named: "menubarIcon")
        statusItem.menu = menu
        
        if let searchItem = menu.item(withTitle: "Search") {
            self.searchItem = searchItem
        }
        
        searchItem.target = self
        searchItem.view = searchView
    }
    
    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
}

extension StatusMenuController: NSMenuDelegate {
    func menuWillOpen(_ menu: NSMenu) {
        print("menuWillOpen(_ menu:)")
    }
}
