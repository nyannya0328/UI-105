//
//  VideoPlayerView.swift
//  UI-105
//
//  Created by にゃんにゃん丸 on 2021/01/16.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
   
    var player : AVPlayer
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}


