//
//  PostListTVC.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import UIKit

class PostListTVC: UITableViewCell {
    
    // MARK:- Outlets
    @IBOutlet weak var vwPost: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    // MARK:- Custom Method
    func configure(_ postDetail: PostListModel) {
        self.lblTitle.text = postDetail.title ?? ""
        self.lblBody.text = postDetail.body
    }
    
    // MARK:- Nib Loading Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
