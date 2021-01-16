//
//  HomeViewModel.swift
//  UI-105
//
//  Created by にゃんにゃん丸 on 2021/01/16.
//

import SwiftUI
import AVKit

class HomeViewModel: ObservableObject {
   @Published var isdark = false
    
    @Published var showplayer = false
    @Published var offset : CGSize = .zero
    @Published var scale :CGFloat = 0
    @Published var selectedVideo : Video = Video(player: AVPlayer())
}

