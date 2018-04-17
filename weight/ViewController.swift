//
//  ViewController.swift
//  weight
//
//  Created by Ido Mizrachi on 14/04/2018.
//  Copyright © 2018 Ido Mizrachi. All rights reserved.
//

import UIKit
import HealthKit
import SnapKit

class ViewController: UIViewController {
    
    let buttonHeight = 60.0
    let padding = 16.0
    
    let healthStore: HKHealthStore = HKHealthStore()
    let manager = WeightManager()
    let display = WeightDisplay()
    lazy var displayLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.displayFont()
        label.text = display.stringValue()
        label.textAlignment = .right
        label.textColor = Theme.textColor()
        label.setContentHuggingPriority(.required, for: .vertical)
        label.layer.cornerRadius = 5
        return label
    }()
    
    lazy var displayBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Theme.displayBackgroundColor()
        return view
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.statusFont()
        label.textColor = Theme.textColor()
        return label
    }()
    
    lazy var clearButton: Button = {
        let button = Button.create()
        button.setTitle("C", for: .normal)
        button.addTarget(self, action: #selector(clearButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var addButton: Button = {
        let button = Button.create()
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(addButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var oneButton: Button = {
        let button = Button.create()
        button.setTitle("1", for: .normal)
        button.addTarget(self, action: #selector(oneButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var twoButton: UIButton = {
        let button = Button.create()
        button.setTitle("2", for: .normal)
        button.addTarget(self, action: #selector(twoButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var threeButton: UIButton = {
        let button = Button.create()
        button.setTitle("3", for: .normal)
        button.addTarget(self, action: #selector(threeButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var fourButton: UIButton = {
        let button = Button.create()
        button.setTitle("4", for: .normal)
        button.addTarget(self, action: #selector(fourButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var fiveButton: UIButton = {
        let button = Button.create()
        button.setTitle("5", for: .normal)
        button.addTarget(self, action: #selector(fiveButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var sixButton: UIButton = {
        let button = Button.create()
        button.setTitle("6", for: .normal)
        button.addTarget(self, action: #selector(sixButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var sevenButton: UIButton = {
        let button = Button.create()
        button.setTitle("7", for: .normal)
        button.addTarget(self, action: #selector(sevenButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var eightButton: UIButton = {
        let button = Button.create()
        button.setTitle("8", for: .normal)
        button.addTarget(self, action: #selector(eightButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var nineButton: UIButton = {
        let button = Button.create()
        button.setTitle("9", for: .normal)
        button.addTarget(self, action: #selector(nineButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var zeroButton: UIButton = {
        let button = Button.create()
        button.setTitle("0", for: .normal)
        button.addTarget(self, action: #selector(zeroButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var dotButton: UIButton = {
        let button = Button.create()
        button.setTitle(".", for: .normal)
        button.addTarget(self, action: #selector(dotButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Theme.backgroundColor()
        self.view.addSubview(self.statusLabel)
        self.view.addSubview(self.displayBackgroundView)
        self.view.addSubview(self.displayLabel)
        self.view.addSubview(self.clearButton)
        self.view.addSubview(self.addButton)
        self.view.addSubview(self.dotButton)
        self.view.addSubview(self.zeroButton)
        self.view.addSubview(self.oneButton)
        self.view.addSubview(self.twoButton)
        self.view.addSubview(self.threeButton)
        self.view.addSubview(self.fourButton)
        self.view.addSubview(self.fiveButton)
        self.view.addSubview(self.sixButton)
        self.view.addSubview(self.sevenButton)
        self.view.addSubview(self.eightButton)
        self.view.addSubview(self.nineButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.displayBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.displayLabel).offset(-self.padding)
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.bottom.equalTo(self.displayLabel).offset(self.padding)
        }
        
        self.displayLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(self.padding)
            make.trailing.equalTo(self.view).offset(-self.padding)
            make.bottom.equalTo(self.addButton.snp.top).offset(-self.padding * 2)
        }
        self.zeroButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-self.padding)
            make.leading.equalTo(self.view).offset(self.padding)
            make.height.equalTo(self.buttonHeight)
        }
        self.dotButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.zeroButton)
            make.leading.equalTo(self.zeroButton.snp.trailing).offset(self.padding)
            make.trailing.equalTo(self.view).offset(-self.padding)
            make.width.equalTo(self.zeroButton).dividedBy(2)
            make.height.equalTo(self.buttonHeight)
        }
        
        self.oneButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.zeroButton.snp.top).offset(-self.padding)
            make.leading.equalTo(self.zeroButton)
            make.height.equalTo(self.buttonHeight)
        }
        
        self.twoButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.oneButton)
            make.leading.equalTo(self.oneButton.snp.trailing).offset(self.padding)
            make.height.equalTo(self.buttonHeight)
            make.width.equalTo(self.oneButton)
        }
        
        self.threeButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.oneButton)
            make.leading.equalTo(self.twoButton.snp.trailing).offset(self.padding)
            make.trailing.equalTo(self.dotButton)
            make.height.equalTo(self.buttonHeight)
            make.width.equalTo(self.oneButton)
        }
        
        self.fourButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.oneButton.snp.top).offset(-self.padding)
            make.leading.equalTo(self.oneButton)
            make.height.equalTo(self.buttonHeight)
        }
        
        self.fiveButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.fourButton)
            make.leading.equalTo(self.fourButton.snp.trailing).offset(self.padding)
            make.height.equalTo(self.buttonHeight)
            make.width.equalTo(self.fourButton)
        }
        
        self.sixButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.fourButton)
            make.leading.equalTo(self.fiveButton.snp.trailing).offset(self.padding)
            make.trailing.equalTo(self.threeButton)
            make.height.equalTo(self.buttonHeight)
            make.width.equalTo(self.fourButton)
        }
        
        self.sevenButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.fourButton.snp.top).offset(-self.padding)
            make.leading.equalTo(self.fourButton)
            make.height.equalTo(self.buttonHeight)
        }
        
        self.eightButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.sevenButton)
            make.leading.equalTo(self.sevenButton.snp.trailing).offset(self.padding)
            make.height.equalTo(self.buttonHeight)
            make.width.equalTo(self.sevenButton)
        }
        
        self.nineButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.sevenButton)
            make.leading.equalTo(self.eightButton.snp.trailing).offset(self.padding)
            make.trailing.equalTo(self.sixButton)
            make.height.equalTo(self.buttonHeight)
            make.width.equalTo(self.sevenButton)
        }
        self.clearButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.sevenButton.snp.top).offset(-self.padding)
            make.leading.equalTo(self.sevenButton)
            make.height.equalTo(self.buttonHeight)
        }
        self.addButton.snp.makeConstraints { (make) in
            make.leading.equalTo(self.clearButton.snp.trailing).offset(self.padding)
            make.bottom.equalTo(self.clearButton)
            make.trailing.equalTo(self.nineButton)
            make.height.equalTo(self.buttonHeight)
            make.width.equalTo(self.clearButton).multipliedBy(2)
        }
        self.statusLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(self.padding)
            make.trailing.equalTo(self.view).offset(-self.padding)
            make.bottom.equalTo(self.displayBackgroundView.snp.top).offset(-16)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)        
        self.manager.latestWeight { [weak self] (weight) in
            guard let `self` = self else {
                return
            }
            self.display.set(value: weight)
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else {
                    return
                }
                self.refreshDisplay()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) { [weak self] in
            guard let `self` = self else {
                return
            }
            let types = Set([HKObjectType.quantityType(forIdentifier: .bodyMass)!])
            self.healthStore.requestAuthorization(toShare: types, read: types) { (success, error) in
                if success {
                    print("granted")
                } else {
                    print("no access")
                }
            }
        }
        
        
    }
    
    private func refreshDisplay() {
        self.displayLabel.text = self.display.stringValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addWeight(_ sender: Any) {
        if HKHealthStore.isHealthDataAvailable() == false {
            return
        }
        let date = Date()
        guard let unit = HKQuantityType.quantityType(forIdentifier: .bodyMass) else {
            return
        }
        let weight = HKQuantity(unit: HKUnit.gram(), doubleValue: 91456)
        let sample = HKQuantitySample(type: unit, quantity: weight, start: date, end: date)
        self.healthStore.save(sample) { (success, error) in
            if success {
                print("added")
            } else {
                print("error \(String(describing: error))")
            }
        }
        
    }
    
    @objc func zeroButtonPressed(sender: UIButton) {
        self.display.add(digit: 0)
        self.refreshDisplay()
    }
    
    @objc func oneButtonPressed(sender: UIButton) {
        self.display.add(digit: 1)
        self.refreshDisplay()
    }
    
    @objc func twoButtonPressed(sender: UIButton) {
        self.display.add(digit: 2)
        self.refreshDisplay()
    }
    
    @objc func threeButtonPressed(sender: UIButton) {
        self.display.add(digit: 3)
        self.refreshDisplay()
    }
    
    @objc func fourButtonPressed(sender: UIButton) {
        self.display.add(digit: 4)
        self.refreshDisplay()
    }
    
    @objc func fiveButtonPressed(sender: UIButton) {
        self.display.add(digit: 5)
        self.refreshDisplay()
    }
    
    @objc func sixButtonPressed(sender: UIButton) {
        self.display.add(digit: 6)
        self.refreshDisplay()
    }
    
    @objc func sevenButtonPressed(sender: UIButton) {
        self.display.add(digit: 7)
        self.refreshDisplay()
    }
    
    @objc func eightButtonPressed(sender: UIButton) {
        self.display.add(digit: 8)
        self.refreshDisplay()
    }
    
    @objc func nineButtonPressed(sender: UIButton) {
        self.display.add(digit: 9)
        self.refreshDisplay()
    }
    
    @objc func dotButtonPressed(sender: UIButton) {
        self.display.addFraction()
        self.refreshDisplay()
    }
    
    @objc func clearButtonPressed(sender: UIButton) {
        self.display.clear()
        self.refreshDisplay()
    }
    
    @objc func addButtonPressed(sender: UIButton) {
        self.manager.addWeight(weight: self.display.decimalValue()) { [weak self] (success) in
            guard let `self` = self else {
                return
            }
            let statusText: String
            if success {
                statusText = "Added new weight \(self.display.decimalValue())"
            } else {
                statusText = "Failed to add new weight"
            }
            self.statusLabel.alpha = 0
            UIView.animate(withDuration: 1, animations: {
                self.statusLabel.alpha = 1
            }, completion: { (finished) in
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    UIView.animate(withDuration: 1, animations: {
                        self.statusLabel.alpha = 0
                    })
                })                
            })
            self.statusLabel.text = statusText
        }
    }
}

