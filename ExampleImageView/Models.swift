//
//  Models.swift
//  ExampleImageView
//
//  Created by pisces on 19/01/2017.
//  Copyright © 2017 pisces. All rights reserved.
//

import Foundation

class DataImageModel {
    var data: Data?
    var thumbData: Data?
    var createdAt: Date?
}

class BundleImageModel {
    var filename: String?
    var thumbFilename: String?
    var createdAt: Date?
}

class WebImageModel {
    var thumbUrl: String?
    var url: String?
    var createdAt: Date?
}
