//
//  UIFontBuilder.swift
//  Stage2
//
//  Created by dejaWorks on 15/05/2019.
//  Copyright © 2019 dejaWorks. All rights reserved.
//

import UIKit

final class UIFontBuilder {
    internal var font: UIFont
    
    enum Kind:Int {
        
        case sRegular,  mRegular, lRegular, xlRegular, xxlRegular
        case sBold,  mBold, lBold, xlBold, xxlBold
        case popupTitle, bigPopupTitle, mLight
        
        
        var weight:UIFont.Weight{
            switch self {
            case .mLight: return UIFont.Weight.light
            case .sRegular, .mRegular, .lRegular, .xlRegular, .xxlRegular:
                return UIFont.Weight.regular
            case .sBold, .mBold, .lBold, .xlBold, .xxlBold:
                return UIFont.Weight.bold
                
            case .popupTitle:return UIFont.Weight.semibold
            case .bigPopupTitle:return UIFont.Weight.semibold
            }
        }
        var size:CGFloat{
            switch self {
            case .sRegular, .sBold: return 12
            case .mRegular, .mBold, .mLight: return 14
            case .lRegular, .lBold: return 16
            case .xlRegular, .xlBold: return 18
            case .xxlRegular, .xxlBold: return 20
            case .popupTitle:return 22
            case .bigPopupTitle:return 28
                
            }
        }
        
    }
    
    // MARK: - Inits
    init(kind:Kind = .mRegular){
        font = UIFont.systemFont(ofSize: kind.size, weight: kind.weight)
    }
    func build()->UIFont{
        return font
    }
    
}
