//
//  DatabaseManager.swift
//  Adnijoo (iOS)
//
//  Created by user212244 on 2/26/22.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    //check if username and email is available
    //parameters:
    //email:string representing email
    //username:string representing username
    
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void){
        completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                //suceeded
                completion(true)
                return
}
            else {
                completion(false)
                return
}
            
        }
           
}
    
    
    
    
    
    
    
    
}









