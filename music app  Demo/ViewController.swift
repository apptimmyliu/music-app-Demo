//
//  ViewController.swift
//  music app  Demo
//
//  Created by Timmy on 2024/3/5.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVPlayer()
    var index = 0
    

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var songPageControl: UIPageControl!
    @IBOutlet weak var shuffleButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        playSong()
        playNewSong()
        replaceCurrentItem()
    }
    
    func updateUI() {
        let song = songs[index]
        singerLabel.text = song.singer
        songNameLabel.text = song.songName
        songImageView.image = UIImage(named: song.cover )
        songPageControl.currentPage = index
    }
    
    
    @IBAction func play(_ sender: UIButton) {
        
        if player.timeControlStatus == .playing {
            sender.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            player.pause()
        } else {
         
            playSong()
        }
    }
    
    
    func playSong() {
        playButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        if player.currentItem == nil {
            replaceCurrentItem()
        }
        player.play()
    }
    
    
    func playNewSong() {
        player.replaceCurrentItem(with: nil)
        playSong()
    }
    
    
    func replaceCurrentItem() {
        let song = songs[index]
        let url = Bundle.main.url(forResource: song.songName, withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        updateUI()
        }
   
    
        @IBAction func next(_ sender: Any) {
            index += 1
            if index == songs.count {
                index = 0
            }
            playNewSong()
           
           
        }
    
        @IBAction func pre(_ sender: Any) {
            index -= 1
            if index < 0 {
                index = songs.count - 1
            }
            playNewSong()
       
        }
        
   
        @IBAction func shuffle(_ sender: Any) {
            index = songs.indices.randomElement()!
            playNewSong()
            
        }
    
        @IBAction func changePageControl(_ sender: UIPageControl) {
            index = songPageControl.currentPage
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
