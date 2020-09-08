//
//  UIViewBuilder.swift
//  Stage2
//
//  Created by dejaWorks on 13/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import UIKit

open class UIViewBuilder:UIMakeup {
    private let view: UIView
    
    // MARK: - Inits

    public init() {
        view = UIView()
        super.init(view)
    }
    /// Don't init with this. It is for only for UIBuilder use.
    override public init(_ ui: UIView) {
        view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        super.init(ui)
    }

    // MARK: - Public methods
    // MARK: - Build and finalize
    open func add(on v: UIView)->Self{
        v.addSubview(view)
        return self
    }
    open func build() -> UIView {
        return view
    }
    open func buildAndAdd(on v: UIView)->UIView {
        v.addSubview(view)
        return view
    }
}
