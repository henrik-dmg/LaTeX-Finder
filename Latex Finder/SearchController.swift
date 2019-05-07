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
    var store: SymbolStore?
    
    override func awakeFromNib() {
        print("search view awoke from nib")
        if let path = Bundle.main.path(forResource: "convertcsv", ofType: "json") {
            let fileURL = URL(fileURLWithPath: path)
            self.store = SymbolStore(fileURL)
        }
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SearchController: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return store?.symbols.count ?? 0
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "LatexCell"), owner: nil) as? LatexCell {
            if let symbol = store?.symbols[row] {
                cell.latexView.latex = symbol.laTeX
                cell.codeLabel.stringValue = symbol.laTeX
                cell.latexView.fontSize = cell.frame.height * 0.4
                print(cell.frame.height)
                cell.latexView.textColor = .white
            }
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
