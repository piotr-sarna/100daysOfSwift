//
//  ViewController.swift
//  TapOrHoldCounter
//
//  Created by Piotr Sarna on 10.04.2018.
//  Copyright © 2018 Piotr Sarna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var counterLabel: UILabel!
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 0
        updateCounterLabel()
    }
    
    private func updateCounterLabel() {
        let formatter = createNumberFormatter()
        let formattedNumber = formatter.string(from: counter as NSNumber)
        
        counterLabel.text = formattedNumber
    }
    
    private func createNumberFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .none
        
        return formatter
    }

    @IBAction private func tapButtonTouchUpInside(_ sender: UIButton) {
        incrementCounter()
    }
    
    @IBAction private func resetButtonAction(_ sender: UIBarButtonItem) {
        counter = 0
        updateCounterLabel()
    }
    
    @IBAction func longPressButtonAction(_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began, .changed:
            incrementCounter()
        default:
            break
        }
    }
    
    private func incrementCounter() {
        counter += 1
        updateCounterLabel()
    }
}

