//
//  LabelWithInset.swift
//  Stage2
//
//  Created by dejaWorks on 03/03/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//
import UIKit

public class LabelWithInset: UILabel {
    
    public var insets:UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10){
        didSet{
            setNeedsDisplay()
        }
    }
    override public func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by:insets))
        //super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override public var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += insets.top + insets.bottom
        intrinsicSuperViewContentSize.width += insets.left + insets.right
        return intrinsicSuperViewContentSize
    }
}
