//
//  LoginVC.swift
//  Spotflock
//
//  Created by Raghu ram mahathi on 27/07/19.
//  Copyright © 2019 Name. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBAction func onLoginTap(_ sender: UIButton) {
        registerUser(email: tfEmail.text ?? "", password: tfPassword.text ?? "")
    }
    
    @IBAction func onRegClick(_ sender: UIButton) {
        
        let storyBord = UIStoryboard(name: "Main", bundle: nil)
        let registerVC = storyBord.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(registerVC, animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func registerUser(email: String, password: String) {
        
        guard let url: URL = URL(string: "https://gospark.app/api/v1/login")else{ return }
        var request: URLRequest = URLRequest(url: url)
        
        let urlSession: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let params: [String: Any] = ["email":"\(email)","password":"\(password)"]
        
        let jsonTodo: Data
        
        do {
            
            jsonTodo = try JSONSerialization.data(withJSONObject: params, options: [])
            
            request.httpBody = jsonTodo
            
        } catch {
            print("Error: cannot create JSON from todo")
            return
        }
        
        
        let task = urlSession.dataTask(with: request) { (data, response, err) in
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                
                print(json)
                
        if let response = json as? [String: Any]{
            if let user = response["user"] as? [String:Any]{
                if let apiToken = user["api_token"] as? String{

                DispatchQueue.main.async {

                let storyBord = UIStoryboard(name: "Main", bundle: nil)
                let newsFeedVC = storyBord.instantiateViewController(withIdentifier: "NewsFeedVC") as! NewsFeedVC
                    let defaults = UserDefaults.standard
                    defaults .set(apiToken, forKey: "apiToken")

                self.navigationController?.pushViewController(newsFeedVC, animated: true)
                }
            }
        }
    }
                
            } catch {
                print("error\(String(describing: err?.localizedDescription))")
            }
        }
        task.resume()
    }
}
