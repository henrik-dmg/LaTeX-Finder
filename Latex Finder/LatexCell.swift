//
//  LatexCell.swift
//  Latex Finder
//
//  Created by Henrik Panhans on 02.05.19.
//  Copyright © 2019 Henrik Panhans. All rights reserved.
//

import Foundation
import iosMath

class LatexCell: NSTableCellView {
    @IBOutlet weak var latexView: MTMathUILabel!
    @IBOutlet weak var codeLabel: NSTextField!
}
