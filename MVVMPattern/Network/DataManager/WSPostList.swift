//
//  WSPostList.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import Foundation
import ObjectMapper
import Alamofire

extension DataManager {
    
    func getPostList(_ completion: @escaping(Result<[PostListModel], APIError>) -> Void) {
        
        NetworkManager.shared.getArray(getURL(.post), mappingType: [PostListModel].self) { (mappableArray, apiError) in
            
            guard let data = mappableArray as? [PostListModel] else {
                completion(.failure(apiError ?? .errorMessage("Something went wrong")))
                return
            }
            completion(.success(data))
        }
    }
    
    //--------------------------------------------------
    
    func getUserBy(id: Int, _ completion: @escaping(Result<UserModel, APIError>) -> Void) {
        
        // Create URL
        let url = getURL(.users) + "/\(id)"
        
        NetworkManager.shared.getResponse(url, mappingType: UserModel.self) { (mappableResponse, apiError) in
            
            guard let data = mappableResponse as? UserModel else {
                completion(.failure(apiError ?? .errorMessage("Something went wrong")))
                return
            }
            completion(.success(data))
        }
    }
    
    //--------------------------------------------------
    
    func getCommentsByPost(id: Int, _ completion: @escaping(Result<[CommentDetail], APIError>) -> Void) {
        
        // Create URL
        let params = [
            "postId": id
        ]
        
        NetworkManager.shared.getArray(getURL(.comments), parameter: params, mappingType: [CommentDetail].self) { (mappableArray, apiError) in
            
            guard let data = mappableArray as? [CommentDetail] else {
                completion(.failure(apiError ?? .errorMessage("Something went wrong")))
                return
            }
            completion(.success(data))
        }
    }
}
