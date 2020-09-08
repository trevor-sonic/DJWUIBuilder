
//
//  UIButtonBuilder.swift
//  Stage2
//
//  Created by dejaWorks on 13/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import UIKit

open class UIButtonBuilder:UIViewBuilder {
    internal var button: UIButton

    // MARK: - Inits
    public init(title: String, type:UIButton.ButtonType = .system) {
        button = UIButton(type: type)
        button.setTitle(title, for: .normal)
        super.init(button)
    }

    public enum Position{
        case iconLeftTextLeft
    }
    public func imageAndTextPos(_ pos:Position = .iconLeftTextLeft)->Self{
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10 , bottom: 0, right: 0)
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        return self
    }
    public func tag(_ n:Int)->Self{
        button.tag = n
        return self
    }
    public func font(size:CGFloat, weight:UIFont.Weight)->Self{
        button.titleLabel?.font = UIFont.monospacedDigitSystemFont(ofSize: size, weight: weight)
        return self
    }
    public func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside)->Self {
        button.addTarget(target, action: action, for: event)
        return self
    }
    public func title(_ title: String, for state:UIControl.State = .normal)->Self{
        button.setTitle(title, for: state)
        return self
    }
    public func image(_ image: UIImage, for state:UIControl.State = .normal)->Self{
        button.setImage(image, for: state)
        return self
    }
    public func bgImage(_ image: UIImage, for state:UIControl.State = .normal)->Self{
        button.setBackgroundImage(image, for: state)
        return self
    }

    public func inset(top: CGFloat = 5, left: CGFloat = 5, bottom: CGFloat = 5, right: CGFloat = 5)->Self{
        button.contentEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }


    // MARK: - Build and finalize
    override public func build() -> UIButton {
        return button
    }
    override public func buildAndAdd(on view: UIView)->UIButton {
        view.addSubview(button)
        return button
    }
    
}


