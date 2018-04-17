//
//  Theme.swift
//  weight
//
//  Created by Ido Mizrachi on 17/04/2018.
//  Copyright © 2018 Ido Mizrachi. All rights reserved.
//

import UIKit

class Theme {
    public static func backgroundColor() -> UIColor {
        return UIColor.black
    }
    
    public static func textColor() -> UIColor {
        return UIColor.white
    }
        
    public static func buttonBackground() -> UIColor {
        return UIColor(white: 0.2, alpha: 1.0)
    }
    
    public static func displayBackgroundColor() -> UIColor {
        return UIColor(white: 0.3, alpha: 1.0)
    }
    
    public static func buttonFont() -> UIFont {
        return UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.medium)
    }
    
    public static func displayFont() -> UIFont {
        return UIFont.systemFont(ofSize: 60, weight: UIFont.Weight.bold)
    }
    
    public static func statusFont() -> UIFont {
        return UIFont.systemFont(ofSize: 26)
    }
}
