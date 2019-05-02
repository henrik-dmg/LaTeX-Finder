//
//  SearchController.swift
//  Latex Finder
//
//  Created by Henrik Panhans on 01.05.19.
//  Copyright © 2019 Henrik Panhans. All rights reserved.
//

import Foundation
import Cocoa
import iosMath

class SearchController: NSView {
    
    @IBOutlet weak var searchBar: NSSearchField!
    @IBOutlet weak var tableView: NSTableView!
    var filteredSymbols: [String] = [String]()
    
    override func awakeFromNib() {
        print("search view awoke from nib")
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SearchController: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "LatexCell"), owner: nil) as? LatexCell {
            cell.latexView.latex = "\\infty"
            cell.latexView.textColor = .white
            cell.codeLabel.stringValue = "\\infty"
            return cell
        }
        
        return nil
    }
}

extension SearchController: NSSearchFieldDelegate {
    func searchFieldDidStartSearching(_ sender: NSSearchField) {
        print(sender.recentSearches)
    }
}
