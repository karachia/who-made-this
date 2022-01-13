//
//  Question.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/10/22.
//

import Foundation
import SwiftUI


struct Question: Hashable {
    var id: Int
    var answer: Composer
    var workIndex: Int
    var options: [Composer]
    var composersWorkNumber: Int
}
