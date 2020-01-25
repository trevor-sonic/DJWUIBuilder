//
//  UIStackViewBuilder.swift
//  Stage2
//
//  Created by dejaWorks on 18/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//
import UIKit

class UIStackViewBuilder {
    private let stack:UIStackView
    
    init() {
        stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
    }
    func alignment(_ alg:UIStackView.Alignment)->Self{
        stack.alignment = alg
        return self
    }
    func distribution(_ dist:UIStackView.Distribution)->Self{
        stack.distribution = dist
        return self
    }
    func axis(_ ax:NSLayoutConstraint.Axis )->Self{
        stack.axis = ax
        return self
    }
    func spacing(_ sp:CGFloat )->Self{
        stack.spacing = sp
        return self
    }
    func add(_ v:UIView?)->Self{
        if let v = v {
            stack.addArrangedSubview(v)
        }else{
            print("📛 view is NIL UIStackView couldn't add the view \(#function) in UIStackViewBuilder")
        }
        return self
    }
    
    func build()->UIStackView{
        return stack
    }
    func buildAndAdd(on v:UIView)->UIStackView{
        v.addSubview(stack)
        return stack
    }
}
