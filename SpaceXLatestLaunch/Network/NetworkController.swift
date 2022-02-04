//
//  Network.swift
//  SpaceXLatestLaunch
//
//  Created by Rumeysa Yücel on 4.02.2022.
//

import UIKit

class NetworkController {
    func fetchLaunchInfo(completion: @escaping (LaunchInfo?) -> Void) {
        let baseUrl = URL(string: "https://api.spacexdata.com/v4/launches/latest")!

        let dataTask = URLSession.shared.dataTask(with: baseUrl) { (data, _, error) in
            let jsonDecoder = JSONDecoder()
            
            if let data = data, let photoInfoObject = try? jsonDecoder.decode(LaunchInfo.self, from: data) {
                completion(photoInfoObject)
            }else {
                completion(nil)
            }
        }
        
        dataTask.resume()
    }
    
    func fetchLaunchPhoto(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            }else {
                completion(nil)
            }
        }
        
        dataTask.resume()
    }
}
