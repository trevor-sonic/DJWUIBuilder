//
//  UILabelBuilder.swift
//  Stage2
//
//  Created by dejaWorks on 13/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import UIKit



final class UILabelBuilder:UIViewBuilder {
    private var label: UILabel
    
    // MARK: - Inits
    init(kind:UIFontBuilder.Kind = .mRegular, text:String = String()){
        label = UILabel()
        label.text = text
        label.font = UIFontBuilder(kind: kind).build()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.baselineAdjustment = UIBaselineAdjustment.alignCenters
        label.textColor = Styler.light
        super.init(label)
    }
    // MARK: - Public methods
    func kind(_ kind:UIFontBuilder.Kind)->Self{
        label.font = UIFontBuilder(kind: kind).build() //UIFont.systemFont(ofSize: kind.size, weight: kind.weight)
        return self
    }
    func fontSize(of size: CGFloat) -> Self {
        label.font = label.font.withSize(size)
        return self
    }
    func fontWeight(of weight: UIFont.Weight) -> Self {
        let font = UIFont.systemFont(ofSize: label.font.pointSize, weight: weight)
        label.font = font
        return self
    }
    func numberOf(lines: Int) -> Self {
        label.numberOfLines = lines
        return self
    }
    override func build() -> UILabel {
        return label
    }
    override func buildAndAdd(on v:UIView) -> UILabel {
        v.addSubview(label)
        return label
    }
}
final class LabelWithInsetBuilder:UIViewBuilder {
    private var label: LabelWithInset
    
    // MARK: - Inits
    init(kind:UIFontBuilder.Kind = .mRegular, text:String = String()){
        label = LabelWithInset()
        label.text = text
        label.font = UIFontBuilder(kind: kind).build()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.baselineAdjustment = UIBaselineAdjustment.alignCenters
        label.textColor = Styler.light
        super.init(label)
    }
    // MARK: - Public methods
    func insets (_ insets:UIEdgeInsets)->Self{
        label.insets = insets
        return self
    }
    func kind(_ kind:UIFontBuilder.Kind)->Self{
        label.font = UIFontBuilder(kind: kind).build()
        return self
    }
    func fontSize(of size: CGFloat) -> Self {
        label.font = label.font.withSize(size)
        return self
    }
    override func font(_ font: UIFont) -> Self {
        label.font = font
        return self
    }
    func numberOf(lines: Int) -> Self {
        label.numberOfLines = lines
        return self
    }
    override func build() -> LabelWithInset {
        return label
    }
    override func buildAndAdd(on v:UIView) -> LabelWithInset {
        v.addSubview(label)
        return label
    }
}
