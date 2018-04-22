//
//  Display.swift
//  weight
//
//  Created by Ido Mizrachi on 20/04/2018.
//  Copyright © 2018 Ido Mizrachi. All rights reserved.
//

import UIKit
import SnapKit

struct DisplayDataModel {
    var previousWeight: String
    var newWeight: String
}

class DisplayView: UIView {
    
    lazy var previousWeightLabel: UILabel = {
        let label = UILabel()
        DisplayView.applyStyleForLabel(label: label)
        return label
    }()

    lazy var displayLabel: UILabel = {
        let label = UILabel()
        DisplayView.applyStyleForLabel(label: label)
        label.text = ""
        return label
    }()
    
    private static func applyStyleForLabel(label: UILabel) {
        label.font = Theme.displayFont()
        label.textAlignment = .right
        label.textColor = Theme.textColor()
        label.layer.cornerRadius = 5
        label.setContentHuggingPriority(.required, for: .vertical)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.previousWeightLabel)
        self.addSubview(self.displayLabel)
        self.displayLabel.isHidden = true
        setupConstraints()
        self.backgroundColor = Theme.displayBackgroundColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        self.displayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(ViewStyle.padding * 2)
            make.leading.equalTo(self).offset(ViewStyle.padding)
            make.trailing.equalTo(self).offset(-ViewStyle.padding)
            make.bottom.equalTo(self).offset(-ViewStyle.padding * 2)
        }
    }

}
