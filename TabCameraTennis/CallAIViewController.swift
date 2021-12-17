//
//  CallAIViewController.swift
//  TabCameraTennis
//
//  Created by Amit Gupta on 12/14/21.
//

import UIKit
import SafariServices

class CallAIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func askAIButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://tennis-tutor-mobile.aiclubacademy.repl.co/") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }

}
