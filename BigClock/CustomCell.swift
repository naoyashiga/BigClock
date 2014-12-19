//
//  CustomCell.swift
//  BigClock
//
//  Created by naoyashiga on 2014/12/19.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
}
