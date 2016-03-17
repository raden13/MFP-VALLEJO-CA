//
//  CustomButton.swift
//  MFP-Vallejo
//
//  Created by Arend Pryor on 3/15/16.
//  Copyright © 2016 RadenDesigns. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 5.0
        backgroundColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }

}
