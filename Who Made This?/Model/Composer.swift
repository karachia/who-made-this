//
//  Composer.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/9/22.
//

import Foundation
import SwiftUI

struct Composer: Hashable, Codable {
    var id: Int
    var fullName: String
    var lastName: String
    var country: String
    var nationality: String
    var born: Int
    var death: Int
    var description: String
    var works: [Music]

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    struct Music: Hashable, Codable {
        var title: String
        var audioName: String
        var excerptName: String
    }
}
