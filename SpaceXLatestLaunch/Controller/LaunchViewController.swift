//
//  ViewController.swift
//  SpaceXLatestLaunch
//
//  Created by Rumeysa Yücel on 4.02.2022.
//

import UIKit

class LaunchViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rocketLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    // MARK: - Properties
    let networkController = NetworkController()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = ""
        detailsLabel.text = ""
        rocketLabel.text = ""
        
        networkController.fetchLaunchInfo { (launchInfo) in
            if let launchInfo = launchInfo {
                self.updateUI(with: launchInfo)
            }
        }
    }
    
    // MARK: - Functions
    func updateUI(with launchInfo: LaunchInfo) {
        networkController.fetchLaunchPhoto(from: launchInfo.links.patch.large) { (image) in
            DispatchQueue.main.async {
                self.imageView.image = image
                self.nameLabel.text = launchInfo.name.uppercased()
                self.rocketLabel.text = "🚀 " + launchInfo.rocket
                
                if launchInfo.details != nil {
                    self.detailsLabel.text = launchInfo.details
                }else {
                    self.detailsLabel.isHidden = true
                }
            }
        }
    }

}

