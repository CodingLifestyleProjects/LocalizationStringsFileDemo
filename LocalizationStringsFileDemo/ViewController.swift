//
//  ViewController.swift
//  LocalizationStringsFileDemo
//
//  Created by Adrian Bobrowski on 29.04.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var breadLabel: UILabel!
    @IBOutlet weak var tomatoLabel: UILabel!
    @IBOutlet weak var cucumberLabel: UILabel!
    
    @IBOutlet weak var breadAmountLabel: UILabel!
    @IBOutlet weak var tomatoAmountLabel: UILabel!
    @IBOutlet weak var cucumberAmountLabel: UILabel!
    
    private var language = "pl"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.l10n()
    }
    
    func l10n() {
        let bundle = self.createBundle(for: self.language)!
        self.title = bundle.localizedString(forKey: "ShoppingList", value: nil, table: nil)
        self.breadLabel.text = bundle.localizedString(forKey: "Bread", value: nil, table: nil)
        self.tomatoLabel.text = bundle.localizedString(forKey: "Tomato", value: nil, table: nil)
        self.cucumberLabel.text = bundle.localizedString(forKey: "Cucumber", value: nil, table: nil)
    }
    
    func createBundle(for language: String) -> Bundle? {
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else {
            return nil
        }
        return Bundle(path: path)
    }
    
    @IBAction func onBreadAmountValueChanged(_ sender: UIStepper) {
        self.breadAmountLabel.text = Int(sender.value).description
    }
    
    @IBAction func onTomatoAmountValueChanged(_ sender: UIStepper) {
        self.tomatoAmountLabel.text = Int(sender.value).description
    }
    
    @IBAction func onCucumberAmountValueChanged(_ sender: UIStepper) {
        self.cucumberAmountLabel.text = Int(sender.value).description
    }
    
    @IBAction func onLanguageChanged(_ sender: UISegmentedControl) {
        self.language = ["pl", "en"][sender.selectedSegmentIndex]
        self.l10n()
    }
}

