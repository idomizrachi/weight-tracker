//
//  Button.swift
//  weight
//
//  Created by Ido Mizrachi on 17/04/2018.
//  Copyright © 2018 Ido Mizrachi. All rights reserved.
//

import UIKit

class Button: UIButton {
    public static func create() -> Button {
        let button = Button(type: .custom)
        button.setTitleColor(Theme.textColor(), for: .normal)
        button.backgroundColor = Theme.buttonBackground()
        button.titleLabel?.font = Theme.buttonFont()
        button.layer.cornerRadius = 5
        return button
    }
}
