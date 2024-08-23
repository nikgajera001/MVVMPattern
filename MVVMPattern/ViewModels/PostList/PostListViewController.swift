//
//  PostListViewController.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import UIKit

class PostListViewController: BaseViewController {

    // MARK:- Outlets
    
    @IBOutlet weak var tblPostList  : UITableView!
    
    
    // MARK:- Variables
    
    private var viewModel           : PostListViewModel?
    
    
    // MARK:- Abstract Method

    class func viewController() -> PostListViewController {
        return UIStoryboard.main.instantiateViewController(withIdentifier: "PostListViewController") as! PostListViewController
    }
    
    
    // MARK:- Custom Methods
    
    func setupView() {
        
        // Register Cell
        self.tblPostList.register(PostListTVC.nib, forCellReuseIdentifier: PostListTVC.identifier)
    }
    
    func bindViewModel() {
        
        self.viewModel = PostListViewModel()
        
        // Success
        self.viewModel?.onPostListSuccess = { [weak self] in
            
            guard let `self` = self else { return }
            self.tblPostList.reloadData()
        }
        
        // Failure
        self.viewModel?.onPostListFailure = { [weak self] errorMessage in
            
            guard let `self` = self else { return }
            self.showAlert(message: errorMessage)
        }
        
        // Call API
        self.viewModel?.getPostList()
    }
    
    
    // MARK:- View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.bindViewModel()
    }
}


// MARK:- Extension - UITableViewDataSource

extension PostListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.arrPostList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostListTVC.identifier, for: indexPath) as! PostListTVC
        
        if let post = self.viewModel?.arrPostList?[indexPath.row] {
            cell.configure(post)
        }
        
        return cell
    }
}


// MARK:- Extension - UITableViewDataSource

extension PostListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postDetailsVC = PostDetailsViewController.viewController()
        postDetailsVC.postDetails = self.viewModel?.arrPostList?[indexPath.row]
        self.navigationController?.pushViewController(postDetailsVC, animated: true)
    }
}
