//
//  DrawView.swift
//  Spotflock
//
//  Created by Raghu ram mahathi on 28/07/19.
//  Copyright © 2019 Name. All rights reserved.
//

import UIKit

@IBDesignable
class DrawView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor = .black {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable
    public var innerFillColor: UIColor = .lightGray {
        didSet {
            self.layer.backgroundColor = innerFillColor.cgColor
        }
    }
    
}
