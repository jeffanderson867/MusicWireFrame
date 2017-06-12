//
//  ViewController.swift
//  MusicWireFrame
//
//  Created by Big J on 6/12/17.
//  Copyright © 2017 AndersonCoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playPauseBackground: UIView!
    @IBOutlet weak var forwardBackground: UIView!
    @IBOutlet weak var reverseBackground: UIView!
    @IBOutlet weak var albumImageView: UIImageView!

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var reverseButton: UIButton!

    var isPlaying: Bool = true {
        didSet {
            if isPlaying {
                playButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)

            }else {
                playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        reverseBackground.layer.cornerRadius = 35.0
        reverseBackground.clipsToBounds = true
        reverseBackground.alpha = 0.0

        playPauseBackground.layer.cornerRadius = 35.0
        playPauseBackground.clipsToBounds = true
        playPauseBackground.alpha = 0

        forwardBackground.layer.cornerRadius = 35.0
        forwardBackground.clipsToBounds = true
        forwardBackground.alpha = 0
    }
    @IBAction func playButtonTapped(_ sender: UIButton) {
        if isPlaying {
            UIView.animate(withDuration: 0.5){
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }else{
            UIView.animate(withDuration: 0.5, animations: { 
            self.albumImageView.transform = CGAffineTransform.identity
            })

        }
        isPlaying = !isPlaying
    }
    @IBAction func touchedDown(_ sender: UIButton) {
        let buttonBackground: UIView

        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        UIView.animate(withDuration: 0.25) { 
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }


    }
    @IBAction func touchedUpInside(_ sender: UIButton) {
        let buttonBackground: UIView

        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        UIView.animate(withDuration: 0.25, animations: {
            buttonBackground.alpha = 0.0
            buttonBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        }) { (_) in
            buttonBackground.transform = CGAffineTransform.identity

        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

