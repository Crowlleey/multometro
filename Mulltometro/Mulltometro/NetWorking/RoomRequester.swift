//
//  CloudCommunication.swift
//  Mulltometro
//
//  Created by George Gomes on 02/10/18.
//  Copyright © 2018 CrowCode. All rights reserved.
//

import Foundation
import Firebase
import Rswift

class RoomRequester {
    
    private static var function = Functions.functions()
    
    private init() {}
    
    static func addRoom(with room: [String: Any], completion: @escaping (Response<Room>) -> Void) {

        function.httpsCallable("addRoom").call(room) { (res, err) in
            
            if let err = err {
                completion(.failure(err))
            }
            if let res = res {
                guard let value = res.data as? [String: Any] else { return }
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
                    let room = try JSONDecoder().decode(Room.self, from: jsonData)
                    completion(.success(room))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
   
  
    
//    function.httpsCallable("addAUser").call(["name": "Giorgino", "idade": "23"]) { res, err in}
}
