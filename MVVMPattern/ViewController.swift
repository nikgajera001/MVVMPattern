//
//  ViewController.swift
//  PracticalDemo
//
//  Created Sagar on 18/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Outlets
    
    
    
    
    // MARK:- Variables
    
    
    
    // MARK:- Abstract Method
    class func viewController() -> OrderTypePopupVC {
        return UIStoryboard.order.instantiateViewController(withIdentifier: "OrderTypePopupVC") as! OrderTypePopupVC
    }
    
    
    // MARK:- Action Methods
    
    
    
    // MARK:- Custom Methods
    

    
    // MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

