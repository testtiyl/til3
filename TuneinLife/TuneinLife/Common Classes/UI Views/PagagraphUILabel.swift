//
//  PagagraphUILabel.swift
//  TuneinLife
//
//  Created by Kanchan on 15/02/17.
//  Copyright © 2017 Shyatoria. All rights reserved.
//

 @IBDesignable
import UIKit

class PagagraphUILabel: UILabel {

    public override func awakeFromNib() {
        super.awakeFromNib()
        configureLabel()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureLabel()
    }
    
    func configureLabel() {
        font = UIConstants.default_paragraph_font
        
    }

}
