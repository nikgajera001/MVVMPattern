//
//  PostDetailsViewController.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import UIKit

class PostDetailsViewController: BaseViewController {

    // MARK:- Outlets

    @IBOutlet weak var tblPostDetail    : UITableView!
    
    
    // MARK:- Variables
    
    var postDetails                     : PostListModel?
    private var viewModel               : PostDetailsViewModel?
    
    
    // MARK:- Abstract Method
    
    class func viewController() -> PostDetailsViewController {
        return UIStoryboard.main.instantiateViewController(withIdentifier: "PostDetailsViewController") as! PostDetailsViewController
    }
    
    
    // MARK:- Custom Methods
    
    private func setupView() {
        
        // Register Cell
        self.tblPostDetail.register(PostDetailTVC.nib, forCellReuseIdentifier: PostDetailTVC.identifier)
        self.tblPostDetail.register(CommentTVC.nib, forCellReuseIdentifier: CommentTVC.identifier)
        self.tblPostDetail.register(CommentSeparatorTVC.nib, forCellReuseIdentifier: CommentSeparatorTVC.identifier)
    }
    
    func bindViewModel() {
        
        // Initilise view mode
        guard let postDetails = self.postDetails else { return }
        self.viewModel = PostDetailsViewModel(postDetails)
        
        // Get user details failure
        self.viewModel?.onGetUserFailure = { [weak self] errorMessage in
            guard let `self` = self else { return }
            self.showAlert(message: errorMessage)
        }
        
        // Get user details success
        self.viewModel?.onGetUserSuccess = { [weak self] in
            guard let `self` = self else { return }
            self.tblPostDetail.reloadData()
            
            // Call API to get comment list
            self.viewModel?.getComments()
        }
        
        // Get commments success
        self.viewModel?.onGetCommentsSuccess = { [weak self] in
            guard let `self` = self else { return }
            self.tblPostDetail.reloadData()
        }
        
        // Call api to get user details
        self.viewModel?.getUser()
    }
    
    
    // MARK:- View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.bindViewModel()
    }
}


// MARK:- Extension - PostDetailsViewController
extension PostDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.viewModel?.commentList?.count ?? 0) == 0 {
            return 1
        } else {
            return (self.viewModel?.commentList?.count ?? 0) + 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: PostDetailTVC.identifier, for: indexPath) as! PostDetailTVC
            
            cell.setName(name: self.viewModel?.userDetail?.name)
            cell.setPost(title: self.postDetails?.title, body: self.postDetails?.body)
            
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentSeparatorTVC.identifier, for: indexPath) as! CommentSeparatorTVC
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentTVC.identifier, for: indexPath) as! CommentTVC
            
            if let commentDetails = self.viewModel?.commentList?[indexPath.row - 2] {
                cell.configure(commentDetails)
            }
            
            return cell
        }
    }
}
