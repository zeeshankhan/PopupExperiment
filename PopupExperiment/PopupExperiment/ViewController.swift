//
//  ViewController.swift
//  ZKSignup
//
//  Created by Zeeshan Khan on 2/18/17.
//  Copyright © 2017 Zeeshan Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnFeedbackPopup: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Experiments"
        btnFeedbackPopup.layer.cornerRadius = 4.0
    }

    @IBAction func cancelRideFeedbackPopup() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CancelRideFeedbackVC")
        vc?.view.backgroundColor = UIColor(white:0, alpha:0.8)
        vc?.definesPresentationContext = true
        vc?.providesPresentationContextTransitionStyle = true
        vc?.modalPresentationStyle = .overCurrentContext
        vc?.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }

}
