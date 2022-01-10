//
//  Question.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/10/22.
//

import Foundation
import SwiftUI


struct Question: Hashable {
    var answer: Composer
    var options: [Composer]
}
