//
//  PostDetailsViewModel.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import Foundation

class PostDetailsViewModel {
    
    // MARK: Variable
    var postDetails     : PostListModel?
    var userDetail      : UserModel?
    var commentList     : [CommentDetail]?
    
    // MARK:- Closure
    var onGetUserSuccess: (() -> Void)?
    var onGetUserFailure: ((_ message: String) -> Void)?
    var onGetCommentsSuccess: (() -> Void)?
    
    // MARK:- API Call
    func getUser() {
        
        guard let userId = self.postDetails?.userId else {
            self.onGetUserFailure?("User not available.")
            return
        }
        
        DataManager.shared.getUserBy(id: userId) { [weak self] (result) in
            
            switch result {
            
            case .success(let userModel):
                self?.userDetail = userModel
                self?.onGetUserSuccess?()
                
            case .failure(let apiError):
                self?.onGetUserFailure?(apiError.localizedDescription)
            }
        }
    }
    
    func getComments() {
        
        guard let postId = self.postDetails?.id else {
            self.onGetUserFailure?("Post not found")
            return
        }
        
        DataManager.shared.getCommentsByPost(id: postId) { (result) in
            
            switch result {
            
            case .success(let commentsListModel):
                self.commentList = commentsListModel
                self.onGetCommentsSuccess?()
                
            case .failure(let apiError):
                print(apiError.localizedDescription)
            }
        }
    }
    
    
    // MARK:- Init Method
    init(_ postDetails: PostListModel) {
        self.postDetails = postDetails
    }
}
