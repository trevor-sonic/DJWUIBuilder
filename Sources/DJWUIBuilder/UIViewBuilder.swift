//
//  UIViewBuilder.swift
//  Stage2
//
//  Created by dejaWorks on 13/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import UIKit

class UIViewBuilder:UIMakeup {
    private let view: UIView
    
    // MARK: - Inits
//    init(frame: CGRect = CGRect.zero) {
//        view = UIView(frame: frame)
//        super.init(view)
//        initView()
//    }
    init() {
        view = UIView()
        super.init(view)
    }
    /// Don't init with this. It is for only for UIBuilder use.
    override internal init(_ ui: UIView) {
        view = UIView()
        super.init(ui)
    }

    // MARK: - Public methods
    // MARK: - Build and finalize
    func add(on v: UIView)->Self{
        v.addSubview(view)
        return self
    }
    func build() -> UIView {
        return view
    }
    func buildAndAdd(on v: UIView)->UIView {
        v.addSubview(view)
        return view
    }
}
