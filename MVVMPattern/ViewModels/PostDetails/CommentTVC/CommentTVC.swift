//
//  CommentTVC.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import UIKit

class CommentTVC: UITableViewCell {
    
    // MARK:- Outlets
    @IBOutlet weak var vwComment: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    // MARK:- Custom Method
    func configure(_ postDetail: CommentDetail) {
        self.lblName.text = postDetail.name ?? ""
        self.lblBody.text = postDetail.body ?? ""
    }
    
    // MARK:- Nib Loading Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
