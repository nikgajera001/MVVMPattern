//
//  PostDetailTVC.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import UIKit

class PostDetailTVC: UITableViewCell {
    
    // MARK:- Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    
    // MARK:- Custom Method
    func setName(name: String?) {
        self.lblName.text = name ?? ""
    }
    
    func setPost(title: String?, body: String?) {
        self.lblTitle.text = title ?? ""
        self.lblBody.text = body ?? ""
    }
    
    // MARK:- Nib Loading Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
