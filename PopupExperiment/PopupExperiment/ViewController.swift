//
//  ViewController.swift
//  ZKSignup
//
//  Created by Zeeshan Khan on 2/18/17.
//  Copyright © 2017 Zeeshan Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnFeedbackPopup: UIButton! {
        didSet {
            btnFeedbackPopup.layer.cornerRadius = 4.0
        }
    }

    @IBOutlet weak var btnBottomSheet: UIButton! {
        didSet {
            btnBottomSheet.layer.cornerRadius = 4.0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Experiments"
    }

    @IBAction func cancelRideFeedbackPopup() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CancelRideFeedbackVC")
        vc?.view.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 0.8)
        vc?.definesPresentationContext = true
        vc?.providesPresentationContextTransitionStyle = true
        vc?.modalPresentationStyle = .overCurrentContext
        vc?.modalTransitionStyle = .crossDissolve
        present(vc!, animated: true, completion: nil)
    }

    
    @IBAction func bottomSheetPopup() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BottomSheetVC")
        vc?.view.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 0.8)
        vc?.definesPresentationContext = true
        vc?.providesPresentationContextTransitionStyle = true
        vc?.modalPresentationStyle = .overCurrentContext
        vc?.modalTransitionStyle = .crossDissolve
        present(vc!, animated: true, completion: nil)
    }

}
