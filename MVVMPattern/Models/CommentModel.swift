//
//  CommentModel.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import Foundation
import ObjectMapper

struct CommentDetail: Mappable {
    var body: String?
    var email: String?
    var id: Int?
    var name: String?
    var postId: Int?
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        body <- map["body"]
        email <- map["email"]
        id <- map["id"]
        name <- map["name"]
        postId <- map["postId"]
    }
}
