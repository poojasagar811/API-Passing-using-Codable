//
//  File.swift
//  API Passing using Codable
//
//  Created by Pooja's MacBook Pro on 20/07/21.
//

import Foundation
import UIKit

struct Album: Codable {
    var postId : Int
    var id : Int
    var name : String
    var email : String
    var body : String
}
