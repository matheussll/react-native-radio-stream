//
//  MLRadioStream.swift
//  MLRadioStream
//
//  Created by Matheus Stefanello Luz on 06/04/18.
//  Copyright © 2018 myaK. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

@objc class MLRadioStream: NSObject {
    private var player: AVPlayer?
    @objc var isPlaying = false

    override init() {
        super.init()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        self.setupRemoteTransportControls()

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch {
            print(error)
        }

    }

    private func createPlayer(streamUrl: String) {
        if let url = NSURL(string: streamUrl) as URL? {
            self.player = AVPlayer(url: url)
        }
    }

   @objc func play(streamUrl: String) {
        createPlayer(streamUrl: streamUrl)
        isPlaying = true
        player?.play()
    }

  @objc func stop() {
        isPlaying = false
        player?.pause()
    }

   @objc func setupRadio(radioTitle: String, radioArtist: String) {
        let songInfo = [
            MPMediaItemPropertyTitle: radioTitle,
            MPMediaItemPropertyArtist: radioArtist,
            ] as [String : Any]
        MPNowPlayingInfoCenter.default().nowPlayingInfo = songInfo
    }


    private func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()

        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            if self.player?.rate == 0.0 {
                self.player?.play()
                return .success
            }
            return .commandFailed
        }

        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.player?.rate == 1.0 {
                self.player?.pause()
                return .success
            }
            return .commandFailed
        }
    }
}
