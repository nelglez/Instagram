//
//  User.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/16/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation

struct User: Encodable, Decodable {
    var uid: String
    var email: String
    var profileImageUrl: String
    var username: String
    var bio: String
    var keywords: [String]
    
    //Not needed thanks for our encodable extension toDictionary()
//    var dict: [String: Any] {
//        return ["uid": uid, "email": email, "profileImageUrl": profileImageUrl, "username": username, "bio": bio, "keywords": keywords]
//        
//    }
    
    
    //Not needed thanks to Decodable extension fromDictionary()
//    static func convertDictionaryToUserStruct(dict: [String: Any]) -> User {
//        let bio = dict["bio"] as! String
//        let email = dict["email"] as! String
//        let profileImageUrl = dict["profileImageUrl"] as! String
//        let username = dict["username"] as! String
//        let keywords = dict["keywords"] as! [String]
//        let uid = dict["uid"] as! String
//
//        let user = User(uid: uid, email: email, profileImageUrl: profileImageUrl, username: username, bio: bio, keywords: keywords)
//        return user
//    }
}
