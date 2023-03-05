//
//  HomePageViewController.swift
//  TaskToFinish
//
//  Created by Apple on 03/03/23.
//

import UIKit
import DropDown

class HomePageViewController: UIViewController {

    @IBOutlet weak var appInnerView: UIView!
    @IBOutlet weak var reportInnerView: UIView!
    @IBOutlet var switchButtonCollection: [UISwitch]!
    @IBOutlet weak var sessionTimeTextField: UITextField!
    @IBOutlet weak var streamingSecTextField: UITextField!
    
    private enum EnumFormSwitchOptions : String, CaseIterable {
        case pushNotification = "Push Notificatiion"
        case DND = "DND Notification"
        case Order = "Order Confirmation"
        case chart = "Trading View Chart"
    }
    private let dropDown = DropDown()
    private let streammingSessionList :  [String] = ["1 SEC","2 SEC"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }

    @IBAction func btnOpenMenuClick(_ sender: Any) {

        dropDown.anchorView = streamingSecTextField
        dropDown.dataSource = streammingSessionList
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.streamingSecTextField.text = item
        }
        dropDown.show()
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        let option = EnumFormSwitchOptions.allCases[sender.tag]
        print(option.rawValue)
        print("Status",sender.isOn)
        
    }
    
    @IBAction func btnApplyFormClick(_ sender: Any) {
        
        for switchBtn in switchButtonCollection {
            let option = EnumFormSwitchOptions.allCases[switchBtn.tag]
            print(option.rawValue)
            print("Status",switchBtn.isOn)
        }
        
        print("Streaming Time ->>",streamingSecTextField.text ?? "")
        print("Session ->>",sessionTimeTextField.text ?? "")
    }
    
}

//MARK: Setup UI
extension HomePageViewController {
    
    private func setUpUI() {
        
        appInnerView.layer.borderWidth = 1.5
        appInnerView.layer.borderColor = UIColor.darkGray.cgColor
        
        reportInnerView.layer.borderWidth = 1.5
        reportInnerView.layer.borderColor = UIColor.darkGray.cgColor
        
        streamingSecTextField.layer.borderWidth = 1.5
        streamingSecTextField.layer.cornerRadius = 15
        streamingSecTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        streamingSecTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        streamingSecTextField.leftViewMode = .always
        
        
        
        
    }
}

