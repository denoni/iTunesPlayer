//
//  RemoteAudio.swift
//  iTunesPlayer
//
//  Created by Gabriel on 9/9/21.
//

import SwiftUI
import AVKit

struct RemoteAudio {
  var player = AVPlayer()
  var isPaused = false
  var lastPlayedURL = ""

  mutating func play(_ audioURL: String) {
    if !isPaused || lastPlayedURL != audioURL {
      let playerItem = AVPlayerItem(url: URL(string: audioURL)!)
      player = AVPlayer(playerItem: playerItem)
    }

    player.play()
    lastPlayedURL = audioURL
  }

  mutating func pause() {
    player.pause()
    isPaused = true
  }

}
