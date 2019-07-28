//
//  ViewController.swift
//  Spotflock
//
//  Created by Raghu ram mahathi on 27/07/19.
//  Copyright © 2019 Name. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfGender: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfMobNumber: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    
    @IBAction func onRegTap(_ sender: UIButton) {
        print("dtlkhjstlkh")
        registerUser(name: tfName.text ?? "", email: tfEmail.text ?? "", password: tfPassword.text ?? "", confirmPass: tfConfirmPassword.text ?? "", mobile: tfMobNumber.text ?? "", gender: tfGender.text ?? "")
    }
    
    
    @IBAction func onBackClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func registerUser(name: String, email: String, password: String, confirmPass: String, mobile: String, gender: String) {
        
        guard let url: URL = URL(string: "https://gospark.app/api/v1/register")else{ return }
        var request: URLRequest = URLRequest(url: url)
        
        let urlSession: URLSession = URLSession(configuration: URLSessionConfiguration.default)

        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        let params: [String: Any] = ["name":"\(name)", "email":"\(email)","password":"\(password)","password_confirmation":"\(confirmPass)","mobile":"\(mobile)","gender":"\(gender)"]
        
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

            } catch {
                print("error\(String(describing: err?.localizedDescription))")
            }
        }
        task.resume()
    }

}

