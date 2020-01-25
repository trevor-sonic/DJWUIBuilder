//
//  File.swift
//  
//
//  Created by dejaWorks on 25/01/2020.
//

import UIKit

final public class LabelWithInsetBuilder:UIViewBuilder {
    private var label: LabelWithInset
    
    // MARK: - Inits
    public init(kind:UIFontBuilder.Kind = .mRegular, text:String = String()){
        label = LabelWithInset()
        label.text = text
        label.font = UIFontBuilder(kind: kind).build()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.baselineAdjustment = UIBaselineAdjustment.alignCenters
        label.textColor = .white
        super.init(label)
    }
    // MARK: - Public methods
    public func insets (_ insets:UIEdgeInsets)->Self{
        label.insets = insets
        return self
    }
    public func kind(_ kind:UIFontBuilder.Kind)->Self{
        label.font = UIFontBuilder(kind: kind).build()
        return self
    }
    public func fontSize(of size: CGFloat) -> Self {
        label.font = label.font.withSize(size)
        return self
    }
    override public func font(_ font: UIFont) -> Self {
        label.font = font
        return self
    }
    public func numberOf(lines: Int) -> Self {
        label.numberOfLines = lines
        return self
    }
    override public func build() -> LabelWithInset {
        return label
    }
    override public func buildAndAdd(on v:UIView) -> LabelWithInset {
        v.addSubview(label)
        return label
    }
}
