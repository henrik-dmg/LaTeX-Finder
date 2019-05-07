//
//  Symbol.swift
//  Latex Finder
//
//  Created by Henrik Panhans on 02.05.19.
//  Copyright © 2019 Henrik Panhans. All rights reserved.
//

import Foundation

typealias Symbol = [SymbolElement]

public struct SymbolElement: Codable, Equatable {
    public let category: Category
    public let subcategory: Subcategory
    public let interpretation: String
    public let laTeX: String
    public let html: String
    public let unicode: String
    
    enum CodingKeys: String, CodingKey {
        case category = "Category"
        case subcategory = "Subcategory"
        case interpretation = "Interpretation"
        case laTeX = "LaTeX"
        case html = "HTML"
        case unicode = "Unicode"
    }
    
    public init(category: Category, subcategory: Subcategory, interpretation: String, laTeX: String, html: String, unicode: String) {
        self.category = category
        self.subcategory = subcategory
        self.interpretation = interpretation
        self.laTeX = laTeX
        self.html = html
        self.unicode = unicode
    }
}

public enum Category: String, Codable, Equatable {
    case arithmetik = "Arithmetik"
    case mengenlehre = "Mengenlehre"
}

public enum Subcategory: String, Codable, Equatable {
    case gleichheitszeichen = "Gleichheitszeichen"
    case mengenkonstruktion = "Mengenkonstruktion"
    case mengenoperationen = "Mengenoperationen"
    case mengenrelationen = "Mengenrelationen"
    case mächtigkeiten = "Mächtigkeiten"
    case rechenzeichen = "Rechenzeichen"
    case vergleichszeichen = "Vergleichszeichen"
    case zahlenmengen = "Zahlenmengen"
}
