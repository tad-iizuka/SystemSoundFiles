//
//  ViewController.swift
//  SystemSoundFiles
//
//  Created by Tadashi on 2016/09/23.
//  Copyright © 2016 T@d. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	var list = [String]()
	
	@IBOutlet var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()

		let filemanager = FileManager()
		let files = filemanager.enumerator(atPath: "/System/Library/Audio/UISounds")
		while let file = files?.nextObject() as! String? {
			if file.hasSuffix("caf") {
				self.list.append(file)
			}
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel!.text = list[indexPath.row]
        return cell
    }

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath as IndexPath, animated: true)
	}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let soundController = segue.destination as! SoundController
		soundController.name = list[(self.tableView.indexPathForSelectedRow?.row)!]
    }
}

