//
//  BaseViewController.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import UIKit

class BaseViewController: UIViewController {

    //--------------------------------------------------
    // MARK:- Custom Methods
    //--------------------------------------------------
    
    func showAlert(title: String? = "Alert", message: String, actions: [UIAlertAction]? = nil, style: UIAlertController.Style? = .alert) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style!)
        
        if actions != nil, actions!.count > 0 {
            actions!.forEach {
                alertController.addAction($0)
            }
        } else {
            let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(actionOK)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    //--------------------------------------------------
    // MARK:- View Life Cycle Methods
    //--------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
