//
//  AuthManager.swift
//  Adnijoo (iOS)
//
//  Created by user212244 on 2/26/22.
//
import FirebaseAuth
import Combine
import UIKit
public class AuthManager
{
    static let shared = AuthManager()
    
    public func registerNewUser(username:String, email:String, password:String, completion: @escaping (Bool) -> Void) {

        /*
         -check if usernaem or email availabe
         -create account
         -insert account to database
         */
        DatabaseManager.shared.canCreateNewUser(with: email, username: username ) { canCreate in
            if canCreate{
                
                /*create account*/
                Auth.auth().createUser(withEmail: email, password: password ) { result, error in
                    guard error == nil, result != nil else {
                        //firbase auth could not create account
                        completion(false)
                        return
}
                    //insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }
                        else{
                            //failed to enter database
                            completion(false)
                            return
}                    }}
    
}        }}
    public func loginUser(username:String?, email:String?, password:String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) {authResult,error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
}
                completion(true)
            }
            
        }
        else if let username = username {
            print(username)
}    }
    
}






