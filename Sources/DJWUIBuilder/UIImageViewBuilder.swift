//
//  UIImageViewBuilder.swift
//  Stage2
//
//  Created by dejaWorks on 26/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//
import UIKit

public class UIImageViewBuilder:UIMakeup {
    private let view: UIImageView

    public init() {
        view = UIImageView()
        super.init(view)
    }
    // MARK: - Public methods
    public func image(_ image:UIImage)->Self{
        self.view.image = image
        return self
    }
    public func contentMode(_ mode:UIView.ContentMode )->Self{
        self.view.contentMode = mode
        return self
    }
    override public func tint(_ color: UIColor) -> Self {
        view.tintColor = color
        return self
    }
    // MARK: - Build and finalize
    public func add(on v: UIView)->Self{
        v.addSubview(view)
        return self
    }
    public func build() -> UIImageView {
        return view
    }
    public func buildAndAdd(on v: UIView)->UIImageView {
        v.addSubview(view)
        return view
    }
}
