//
//  Http.swift
//  Spotflock
//
//  Created by Raghu ram mahathi on 28/07/19.
//  Copyright © 2019 Name. All rights reserved.
//

import Foundation

class HTTP {
    
    class func connection(API: String, httpMethod: String,_ success: @escaping (_ json: Any?)-> Void, failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        
        let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        guard let url = URL(string: API)else{return}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let defaults = UserDefaults.standard;
        let apiToken = defaults.object(forKey: "apiToken") as! String
        print(apiToken)
        urlRequest.addValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod=httpMethod
        
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                print(responseJSON)
                DispatchQueue.main.async {
                    success(responseJSON)
                }
            } catch {
                DispatchQueue.main.async {
                    failure(error.localizedDescription)
                }
            }
        })
        dataTask.resume()
        
    }
    
}
