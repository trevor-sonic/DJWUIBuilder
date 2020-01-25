//
//  UIMorpher.swift
//  Stage2
//
//  Created by dejaWorks on 14/10/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import UIKit


open  class UIMakeup{
    
    internal let uis:[UIView]
    
//    enum Style {
//        case neonBorderedDark
//        case darkBGWithLightContent
//    }
    
//    func style(_ style:Style)->Self{
//        switch style {
//        case .neonBorderedDark:
//            let color = Styler.neonBlueLightColor
//            return self.border(1, color: color).round(3).tint(color).bgColor(Styler.dark2)
//        
//        case .darkBGWithLightContent:
//            let color = Styler.light
//            return self.tint(color).bgColor(Styler.dark2)
//            
//        }
//    }
    
    public init(_ ui:UIView) {
        self.uis = [ui]
        initViews()
    }
    public init(_ uis:[UIView]) {
        self.uis = uis
        initViews()
    }
    func initViews(){
        _ = self.uis.map({ view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.masksToBounds = true
            view.backgroundColor = .clear
            view.isOpaque = true
        })
    }
    // MARK: - Base UIView related
    /// Background color
    public func bgColor(_ color:UIColor)->Self{
        _ = self.uis.map({ ui in
            ui.backgroundColor = color
        })
        return self
    }
    /// Border thickness and color
    public func border(_ thickness:CGFloat = 1, color:UIColor = .white)->Self{
        _ = self.uis.map({ view in
            view.layer.borderWidth = thickness
            view.layer.borderColor = color.cgColor
        })
        return self
    }
    /// Border round
    public func round(_ radius:CGFloat = 3)->Self{
        _ = self.uis.map({ view in
            view.layer.cornerRadius = radius
        })
        return self
    }
    /// Is Hidden?
    public func isHidden(_ hidden:Bool)->Self{
        _ = self.uis.map({ view in
            view.isHidden = hidden
        })
        return self
    }
    /// Alpha set with CGFloat
    public func alpha(_ value:CGFloat)->Self{
        _ = self.uis.map({ view in
            view.alpha = value
        })
        return self
    }
    /// Alpha set with Double
    public func alpha(_ value:Double)->Self{
        _ = self.uis.map({ view in
            view.alpha = CGFloat(value)
        })
        return self
    }
    // MARK: - UILabel related
    /// UILabel align
    public func align(_ align:NSTextAlignment)->Self{
        _ = self.uis.map({ label in
            (label as? UILabel)?.textAlignment = align
        })
        return self
    }
    /// UILabel color
    public func textColor(with color: UIColor, state:UIControl.State = .normal) -> Self {
        _ = self.uis.map({ ui in
            (ui as? UILabel)?.textColor = color
            (ui as? UIButton)?.setTitleColor(color, for: state)
            
        })
        return self
    }
    /// Uppercase labels
    public func uppercased() -> Self {
        _ = self.uis.map({ ui in
            (ui as? UILabel)?.text =  (ui as? UILabel)?.text?.uppercased()
        })
        return self
    }
    
    // MARK: - UIButton related
    /// UIButton tint color
    public func tint(_ color:UIColor)->Self{
        _ = self.uis.map({ ui in
            (ui as? UIButton)?.tintColor = color
            
        })
        return self
    }
    
    /// UIButton tint color
    open func font(_ font:UIFont)->Self{
        _ = self.uis.map({ ui in
            
            if let button = ui as? UIButton{
                button.titleLabel?.font = font
            }
            if let label = ui as? UILabel{
                label.font = font
            }
        })
        return self
    }
    public func img(_ img:UIImage, state: UIControl.State = .normal)->Self{
        _ = self.uis.map({ btn in
            
            if let button = btn as? UIButton{
                button.setImage(img, for: state)
            }
        })
        return self
    }
    public func bgImage(_ img:UIImage, state: UIControl.State = .normal)->Self{
        _ = self.uis.map({ btn in
            
            if let button = btn as? UIButton{
                button.setBackgroundImage(img, for: state)
            }
        })
        return self
    }
}
