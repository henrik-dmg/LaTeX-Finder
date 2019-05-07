//
//  SymbolStore.swift
//  Latex Finder
//
//  Created by Henrik Panhans on 03.05.19.
//  Copyright © 2019 Henrik Panhans. All rights reserved.
//

import Foundation

class SymbolStore {
    public var symbols = [SymbolElement]()
    
    init(_ path: URL) {
        // Initialise from Symbol list here
        do {
            let data = try Data(contentsOf: path)
            let jsonDecoder = JSONDecoder()
            
            symbols = try jsonDecoder.decode([SymbolElement].self, from: data)
        } catch let error {
            print(error.localizedDescription)
        }
        
        print(symbols.count)
    }
}
