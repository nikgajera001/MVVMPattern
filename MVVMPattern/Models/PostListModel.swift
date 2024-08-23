//
//  PostListModel.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import Foundation
import ObjectMapper

struct PostListModel: Mappable {
    var body: String?
    var id: Int?
    var title: String?
    var userId: Int?
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        body <- map["body"]
        id <- map["id"]
        title <- map["title"]
        userId <- map["userId"]
    }
}

