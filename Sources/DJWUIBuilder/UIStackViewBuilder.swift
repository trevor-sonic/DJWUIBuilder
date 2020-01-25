//
//  UIStackViewBuilder.swift
//  Stage2
//
//  Created by dejaWorks on 18/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//
import UIKit

open class UIStackViewBuilder {
    private let stack:UIStackView
    
    public init() {
        stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
    }
    public func alignment(_ alg:UIStackView.Alignment)->Self{
        stack.alignment = alg
        return self
    }
    public func distribution(_ dist:UIStackView.Distribution)->Self{
        stack.distribution = dist
        return self
    }
    open func axis(_ ax:NSLayoutConstraint.Axis )->Self{
        stack.axis = ax
        return self
    }
    public func spacing(_ sp:CGFloat )->Self{
        stack.spacing = sp
        return self
    }
    public func add(_ v:UIView?)->Self{
        if let v = v {
            stack.addArrangedSubview(v)
        }else{
            print("📛 view is NIL UIStackView couldn't add the view \(#function) in UIStackViewBuilder")
        }
        return self
    }
    
    public func build()->UIStackView{
        return stack
    }
    public func buildAndAdd(on v:UIView)->UIStackView{
        v.addSubview(stack)
        return stack
    }
}
