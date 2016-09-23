//
//  DetailViewController.swift
//  SystemSoundFiles
//
//  Created by Tadashi on 2016/09/23.
//  Copyright © 2016 T@d. All rights reserved.
//

import UIKit
import AudioToolbox

class SoundController: UIViewController {


	@IBOutlet weak var fileName: UILabel!
	@IBOutlet weak var button: UIButton!

	@IBAction func button(_ sender: AnyObject) {
		self.makeSound()
	}
	
	func makeSound() {
		var soundId:SystemSoundID = 0
		let soundUrl = NSURL.fileURL(withPath: "/System/Library/Audio/UISounds/" + name)
		AudioServicesCreateSystemSoundID(soundUrl as CFURL, &soundId)
		AudioServicesPlaySystemSound(soundId)
	}
	
	var name = String()

    override func viewDidLoad() {
        super.viewDidLoad()

		self.fileName.text = name

		self.makeSound()
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
