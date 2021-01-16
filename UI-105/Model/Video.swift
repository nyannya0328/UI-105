//
//  Video.swift
//  UI-105
//
//  Created by にゃんにゃん丸 on 2021/01/16.
//

import SwiftUI
import AVKit

struct Video: Identifiable {
    var id = UUID().uuidString
    var player : AVPlayer
}
func getBundleID(filename : String) -> URL{
    
    let bundle = Bundle.main.path(forResource: filename, ofType: "mp4")
    
    return URL(fileURLWithPath: bundle!)
    
}

var videos = [
    
    Video(player: AVPlayer(url: getBundleID(filename: "Moon - 42422"))),
    Video(player: AVPlayer(url: getBundleID(filename: "Sunset - 43292"))),
    Video(player: AVPlayer(url: getBundleID(filename: "Owl - 56136"))),
    Video(player: AVPlayer(url: getBundleID(filename: "Storm - 40581"))),
    Video(player: AVPlayer(url: getBundleID(filename: "The Moon - 19169"))),
    Video(player: AVPlayer(url: getBundleID(filename: "Waterfall - 37088"))),
    Video(player: AVPlayer(url: getBundleID(filename: "New Year - 60404"))),
    Video(player: AVPlayer(url: getBundleID(filename: "Cheetah - 53486"))),
    
    

]

