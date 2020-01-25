//
//  UIScrollViewBuilder.swift
//  Stage2
//
//  Created by dejaWorks on 15/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import UIKit

final class UIScrollViewBuilder:UIViewBuilder {
    private let scrollView: UIScrollView

    // MARK: - Inits
    override init() {
        scrollView = UIScrollView()
        super.init(scrollView)
    }
    
    // MARK: - Public methods
    func delaysContentTouches(_ bool:Bool)->Self{
        scrollView.delaysContentTouches = bool
        return self
    }
    
    // MARK: - Build and finalize
    override func add(on v: UIView)->Self{
        v.addSubview(scrollView)
        return self
    }
    override func build() -> UIScrollView {
        return scrollView
    }
    override func buildAndAdd(on v: UIView)->UIScrollView {
        v.addSubview(scrollView)
        return scrollView
    }
    
}
