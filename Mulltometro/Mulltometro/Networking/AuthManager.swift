//
//  FirebaseAuthManager.swift
//  Mulltometro
//
//  Created by George Gomes on 25/09/18.
//  Copyright © 2018 CrowCode. All rights reserved.
//

import Foundation
import Rswift

class AuthManager {
    
    
    private init() {}
    
    static func selfUser(completion: @escaping (Response<User>) -> Void) {
        let user: User =  CDManager.Object()
    
        CDManager.getSinlgeObject(user, completionHandler: { response in
            switch response {
            case .success(let user):
                completion(.success(user))
            case .failure(let err):
                completion(.failure(err))
            }
        })
    }
    
    static func isLogged() -> Bool {
        // TODO: - REFACTORING FIREBAE
        return false
    }
    
    static func getCurrentUserId() -> Int {
        // TODO: - REFACTORING FIREBAE
        return 0 //"TODO"
    }
    
    static func setUser(name: String, completion: @escaping (Error?) -> Void) {
       // TODO: - REFACTORING FIREBAE
    }
    
    static func getCurrentEmail() -> String {
        // TODO: - REFACTORING FIREBAE
        return "TODO"
    }
    
    static func eraseLogData() {
       // TODO: - REFACTORING FIREBAE
    }
    
    static func login (email: String, password: String, completion: @escaping (Response<MulltometroUser>) -> Void) {
        let param = [
            "email": email,
            "password": password
        ]
        
        HTTPRequester.request(route: .auth, function: .login, parameters: param, completion: { response in
            
            switch response {
                
            case .success(let data):
                do {
                    
                    let userAndToken = try JSONDecoder().decode(UserAndToken.self, from: data)
                    let keychainToken = KeychainHelper(service: KeychainConfiguration.serviceName, account: "Token", accessGroup: KeychainConfiguration.accessGroup)
                    
                    try keychainToken.savePassword(userAndToken.token)
                    
                    
                    let passwordItem = KeychainHelper(service: KeychainConfiguration.serviceName, account: "Token", accessGroup: KeychainConfiguration.accessGroup)
                    
                    let i = passwordItem.account
                    let b = try passwordItem.readPassword()
                    
                    let todos =  try KeychainHelper.passwordItems(forService: KeychainConfiguration.serviceName, accessGroup: KeychainConfiguration.accessGroup)
                    
                    completion(.success(userAndToken.user))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
            

        })
    }
    
    static func createUser(with email: String, password: String, completion: @escaping(Response<MulltometroUser>) -> Void) {
       // TODO: - REFACTORING FIREBAE
    }
    
    static func logout(completion: @escaping(Response<Bool>) -> Void) {
        // TODO: - REFACTORING FIREBAE
    }
}
//let param = [
//    "email": "georgegomees@gmail.com",
//    "password": "SolMaior"
//]
//
//HTTPRequester.request(route: .auth, function: .login, parameters: param, completion: { response in
//
//})

struct UserAndToken: Codable {
    var user: MulltometroUser!
    var token: String!
}
