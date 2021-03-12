//
//  UILabelBuilder.swift
//  Stage2
//
//  Created by dejaWorks on 13/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import UIKit



final public class UILabelBuilder:UIViewBuilder {
    private var label: UILabel
    
    // MARK: - Inits
    public init(kind:UIFontBuilder.Kind = .mRegular, text:String = String()){
        label = UILabel()
        label.text = text
        label.font = UIFontBuilder(kind: kind).build()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.baselineAdjustment = UIBaselineAdjustment.alignCenters
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        super.init(label)
    }
    // MARK: - Public methods
    public func kind(_ kind:UIFontBuilder.Kind)->Self{
        label.font = UIFontBuilder(kind: kind).build() //UIFont.systemFont(ofSize: kind.size, weight: kind.weight)
        return self
    }
    public func fontSize(of size: CGFloat) -> Self {
        label.font = label.font.withSize(size)
        return self
    }
    public func fontWeight(of weight: UIFont.Weight) -> Self {
        let font = UIFont.systemFont(ofSize: label.font.pointSize, weight: weight)
        label.font = font
        return self
    }
    public func numberOf(lines: Int) -> Self {
        label.numberOfLines = lines
        return self
    }
    
    public func shadow(color:UIColor = .black,
                       size:CGFloat = 0.5,
                       radius:CGFloat = 0.5,
                       opacity:Float = 0.5) -> Self{
        label.layer.shadowColor = color.cgColor
        label.layer.shadowRadius = radius
        label.layer.shadowOpacity = opacity
        label.layer.shadowOffset = CGSize(width: size, height: size)
        label.layer.masksToBounds = false
        return self
    }
    
    override public func build() -> UILabel {
        return label
    }
    override public func buildAndAdd(on v:UIView) -> UILabel {
        v.addSubview(label)
        return label
    }
}

