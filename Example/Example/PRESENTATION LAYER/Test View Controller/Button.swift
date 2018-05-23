//
//  Button.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }
    
    private func _init() {
        setTitleColor(.black, for: .normal)
        setTitle(titleLabel?.text?.uppercased(), for: .normal)
        
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

}
