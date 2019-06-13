//
//  Constant.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 3/13/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import Foundation
import UIKit

struct PhysicsCategory {
    static let Crocodile: UInt32 = 1
    static let VineHolder: UInt32 = 2
    static let Vine: UInt32 = 4
    static let Prize: UInt32 = 8
}

struct Layer {
    static let Background: CGFloat = 0
    static let Crocodile: CGFloat = 1
    static let Vine: CGFloat = 1
    static let Prize: CGFloat = 2
    static let Foreground: CGFloat = 3
}
struct ImageName {
    static let Background = "Background"
    static let Ground = "Ground"
    static let Water = "Water"
    static let VineTexture = "VineTexture"
    static let VineHolder = "VineHolder"
    static let CrocMouthClosed = "CrocMouthClosed"
    static let CrocMouthOpen = "CrocMouthOpen"
    static let CrocMask = "CrocMask"
    static let Prize = "Pineapple"
    static let PrizeMask = "PineappleMask"
}

struct GameConfiguration {
    static let VineDataFile = "VineData.plist"
    static let CanCutMultipleVinesAtOnce = false
}
