//
//  UserModel.swift
//  MVVMPattern
//
//  Created by iOS on 18/03/21.
//

import Foundation
import ObjectMapper

// User Model
struct UserModel: Mappable {
    var address: Address?
    var company: Company?
    var email: String?
    var id: Int?
    var name: String?
    var phone: String?
    var username: String?
    var website: String?
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        address <- map["address"]
        company <- map["company"]
        email <- map["email"]
        id <- map["id"]
        name <- map["name"]
        phone <- map["phone"]
        username <- map["username"]
        website <- map["website"]
    }
}

// Company
struct Company: Mappable {
    var bs: String?
    var catchPhrase: String?
    var name: String?
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        bs <- map["bs"]
        catchPhrase <- map["catchPhrase"]
        name <- map["name"]
    }
}

// Address
struct Address: Mappable {
    var city: String?
    var geo: Geo?
    var street: String?
    var suite: String?
    var zipcode: String?
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        city <- map["city"]
        geo <- map["geo"]
        street <- map["street"]
        suite <- map["suite"]
        zipcode <- map["zipcode"]
    }
}

// Geo
struct Geo: Mappable {
    var lat: String?
    var lng: String?
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        lat <- map["lat"]
        lng <- map["lng"]
    }
}
