//
//  SoundPlayer.swift
//  MyMusic
//
//  Created by Tomoya Hiraiwa on 2023/11/08.
//

import UIKit
import AVFoundation
class SoundPlayer: NSObject {
    let cymbalData = NSDataAsset(name: "cymbalSound")!.data
    let guitarData = NSDataAsset(name: "guitarSound")!.data
    
    var cymbalPlayer: AVAudioPlayer!
    var guitarPlayer: AVAudioPlayer!
    func cymbalPlay(){
        do {
            cymbalPlayer = try AVAudioPlayer(data: cymbalData)
            cymbalPlayer.play()
        }
        catch {
            print("Audio Error")
        }
    }
    func guitarPlay(){
        do {
            guitarPlayer = try AVAudioPlayer(data: guitarData)
            guitarPlayer.play()
        }
        catch {
            print("Audio Error")
        }
    }
}
