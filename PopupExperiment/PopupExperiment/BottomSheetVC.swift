//
//  BottomSheetVC.swift
//  PopupExperiment
//
//  Created by Zeeshan Khan on 5/2/17.
//  Copyright © 2017 Zeeshan Khan. All rights reserved.
//

import UIKit

class BottomSheetVC: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var seatsView: NumberOfSeatsView!
    @IBOutlet weak private var bottonConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reasons = ["One Seat", "Two Seat", "Three Seats", "Four Seat"]
        seatsView.populateReasons(reasons)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.2) {
            self.bottonConstraint.constant = 0.0;
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func closeAction() {

        UIView.animate(withDuration: 0.2) {
            self.bottonConstraint.constant = -420.0;
            self.view.layoutIfNeeded()
        }

        dismiss(animated: true, completion: nil)
    }

}

class NumberOfSeatsView: UIView {
    
    @IBOutlet weak var reasonTableView: UITableView!
    var arrReason: [String] = []
    var selectedIndex = 0
    
//    override func awakeFromNib() {
//        reasonTableView.rowHeight = UITableViewAutomaticDimension
//    }
    
    func populateReasons(_ reasons: [String]) {
        arrReason = reasons
        reasonTableView.reloadData()
        self.invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize.init(width: self.frame.size.width, height: reasonTableView.contentSize.height)
    }
}

extension NumberOfSeatsView : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrReason.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeatsCell", for: indexPath) as! SeatsCell
        cell.nameLabel.text = arrReason[indexPath.row]
        cell.priceLabel.text = "AED 24"
        if selectedIndex > -1 && selectedIndex == indexPath.row {
            cell.checkIcon.image = #imageLiteral(resourceName: "icnCorrect")
        } else {
            cell.checkIcon.image = nil
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previoudIP = IndexPath(row: selectedIndex, section: indexPath.section)
        selectedIndex = indexPath.row
        tableView.reloadRows(at: [previoudIP, indexPath], with: .automatic)
    }
}

class SeatsCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var checkIcon: UIImageView!
    
    override func awakeFromNib() {
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9725490196, alpha: 1)
        self.selectedBackgroundView = bgColorView
    }
}
