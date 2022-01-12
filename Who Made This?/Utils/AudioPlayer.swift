//
//  AudioPlayer.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/12/22.
//

import Foundation
import AVFoundation

 class AudioPlayer {
   static var audioPlayer: AVAudioPlayer?

   static func playMusic(fileName: String) {

       if let path = Bundle.main.url(forResource: fileName, withExtension: "mp3"){

           do {

               audioPlayer = try AVAudioPlayer(contentsOf: path)
               audioPlayer?.prepareToPlay()
               audioPlayer?.play()

           } catch {
               print("Error")
           }
       }
    }
     
     static func stopMusic() {
         audioPlayer?.pause()
     }
     
     static func isPlaying() -> Bool{
         return audioPlayer?.isPlaying ?? false
     }
 }
