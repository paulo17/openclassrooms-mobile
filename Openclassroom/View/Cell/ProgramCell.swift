//
//  ProgramCell.swift
//  Openclassroom
//
//  Created by Paul on 30/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ProgramCell: UITableViewCell {
    
    static let identifier = "program_cell"
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var roundBackgroundView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var finishButton: UIButton! {
        didSet {
            finishButton.addTarget(self, action: #selector(ProgramCell.choose), forControlEvents: .TouchUpInside)
        }
    }
    
    weak var delegate: ProgramViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func choose() {
        delegate.chooseProgram()
    }
    
}
