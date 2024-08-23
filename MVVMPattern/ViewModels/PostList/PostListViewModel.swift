//
//  PostListViewModel.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import Foundation

class PostListViewModel {
    
    // MARK: Variable
    var arrPostList: [PostListModel]?
    
    
    // MARK:- Closure
    var onPostListSuccess: (() -> Void)?
    var onPostListFailure: ((_ message: String) -> Void)?
    
    
    // MARK:- API Call
    func getPostList() {

        DataManager.shared.getPostList { [weak self] (result) in
            
            switch result {
            
            case .success(let postListModel):
                self?.arrPostList = postListModel
                self?.onPostListSuccess?()
                
            case .failure(let apiError):
                self?.onPostListFailure?(apiError.localizedDescription)
            }
        }
    }
}
