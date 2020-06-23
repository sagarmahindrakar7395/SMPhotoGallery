//
//  NetworkManger.swift
//  SMPhotoGallery
//
//  Created by Sagar Mahindrakar on 22/06/20.
//  Copyright © 2020 SagarMahindrakar. All rights reserved.
//

import Foundation

class NetworkManger {

    static let sharedInstance = NetworkManger()

    func getData(params:[String:Any], stringURL:String, success:@escaping(Any) -> Void, failure:@escaping(String) -> Void)
    {
        if let url = URL(string: stringURL)
        {
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let smResponse = response as? HTTPURLResponse, smResponse.statusCode == 200
                {
                    do {
                        if let data = data
                        {
                            let json = try JSONSerialization.jsonObject(with: data) as! [[String:Any]]
                            DispatchQueue.main.async {
                                success(json)
                            }
                        }
                        else
                        {
                            DispatchQueue.main.async {
                                failure(constants.errors.networkError);
                            }
                        }
                    } catch {
                        DispatchQueue.main.async {
                            failure(constants.errors.networkError);
                        }
                    }
                }
                else
                {
                    DispatchQueue.main.async {
                        failure(constants.errors.networkError);
                    }
                }
            }

            task.resume()
        }
        else
        {
            failure(constants.errors.networkError);
        }
    }

    func getImageData(params:[String:Any], stringURL:String, success:@escaping(Any) -> Void, failure:@escaping(String) -> Void)
    {
        if let url = URL(string: stringURL)
        {
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let smResponse = response as? HTTPURLResponse, smResponse.statusCode == 200
                {
                    do {
                        if let data = data
                        {
                            DispatchQueue.main.async {
                                success(data)
                            }
                        }
                        else
                        {
                            DispatchQueue.main.async {
                                failure(constants.errors.networkError)
                            }
                        }
                    }
                }
                else
                {
                    DispatchQueue.main.async {
                        failure(constants.errors.networkError);
                    }
                }
            }

            task.resume()
        }
        else
        {
            failure(constants.errors.networkError);
        }
    }

}
