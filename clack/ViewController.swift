//
//  ViewController.swift
//  clack
//
//  Created by Mackenzie Craig on 2018-07-04.
//  Copyright © 2018 mcknzcrg. All rights reserved.
//

import Cocoa
import AVFoundation

class ViewController: NSViewController {
    
    var config_volume = 50.0

    @IBAction func slider(sender : NSSlider) {
        config_volume = sender.doubleValue
    }
    
    var clickSound: AVAudioPlayer?
    let url = Bundle.main.url(forResource: "keypress", withExtension: "wav")!
    
    class func addGlobalMonitorForEvents(matching mask: NSEvent.EventTypeMask, handler block: @escaping (NSEvent) -> Void) -> Any? {
        return ViewController.self
    }
    
    func keyPressed() {
        do {
            clickSound = try AVAudioPlayer(contentsOf: url)
            clickSound?.volume = Float(config_volume/10)
            clickSound?.play()
        } catch {
            // couldn't load file
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String : true]
        let accessEnabled = AXIsProcessTrustedWithOptions(options)
        
        if !accessEnabled {
            print("Access Not Enabled")
        } else {
            print("Access is enabled")
        }
        
        NSEvent.addGlobalMonitorForEvents(matching: .flagsChanged) {
            switch $0.modifierFlags.intersection(.deviceIndependentFlagsMask) {
            case [.shift]:
                self.keyPressed()
            case [.control]:
                self.keyPressed()
            case [.option] :
                self.keyPressed()
            case [.command]:
                self.keyPressed()
            default:
                break
            }
        }
        
        NSEvent.addGlobalMonitorForEvents(matching: [.keyDown]) { (event) in
            self.keyPressed()
        }

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

