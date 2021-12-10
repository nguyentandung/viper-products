//
//  Models.swift
//  ViperProducts
//
//  Created by Nguyen Tan Dung on 12/08/21.
//

import UIKit

struct Product : Decodable {
    var id : Int?
    var errorDescription : String?
    var name : String?
    var sku : String?
    var image : String?
    var color : Int?
}

struct Color: Decodable {
    var id: Int?
    var name: String?
}

enum StatusCallAPI {
    case error,success
}

enum InternetConnection {
    case failture,success,connecting,undenfine
}

