//
//  CancelRideFeedbackVC.swift
//  ZKSignup
//
//  Created by Zeeshan Khan on 3/4/17.
//  Copyright © 2017 Zeeshan Khan. All rights reserved.
//

import UIKit

class CancelRideFeedbackVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var reasonView: CancelReasonView!

    override func viewDidLoad() {
        super.viewDidLoad()

        containerView.layer.cornerRadius = 4.0
        okButton.layer.cornerRadius = 4.0

        let reasons = ["Taking too long",
                       "Changed my mind",
                       "Wrong location",
                       "Just trying",
                       "Found another transport"
                    ]
        reasonView.populateReasons(reasons)
    }

    @IBAction func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
}

class CancelReasonView: UIView {

    @IBOutlet weak var reasonTableView: UITableView!
    var arrReason: [String] = []
    var selectedIndex = -1

    override func awakeFromNib() {
        reasonTableView.rowHeight = UITableViewAutomaticDimension
    }

    func populateReasons(_ reasons: [String]) {
        arrReason = reasons
        reasonTableView.reloadData()
        self.invalidateIntrinsicContentSize()
    }

    override var intrinsicContentSize: CGSize {
        return CGSize.init(width: self.frame.size.width, height: reasonTableView.contentSize.height)
    }
}

extension CancelReasonView : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrReason.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ReasonCell", for: indexPath) as! ReasonCell
        cell.reasonLabel.text = arrReason[indexPath.row]
        if selectedIndex > -1 && selectedIndex == indexPath.row {
            cell.checkIcon.image = #imageLiteral(resourceName: "checkON")
            cell.reasonLabel.font = UIFont.systemFont(ofSize: 16)
            cell.reasonLabel.textColor = UIColor.darkText
        } else {
            cell.checkIcon.image = #imageLiteral(resourceName: "checkOFF")
            cell.reasonLabel.font = UIFont.systemFont(ofSize: 16)
            cell.reasonLabel.textColor = UIColor(colorLiteralRed: 109/255.0, green: 110/255.0, blue: 112/255.0, alpha: 1)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previoudIP = IndexPath(row: selectedIndex, section: indexPath.section)
        selectedIndex = indexPath.row
        tableView.reloadRows(at: [previoudIP, indexPath], with: .automatic)
    }
}

class ReasonCell: UITableViewCell {

    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var checkIcon: UIImageView!
}
