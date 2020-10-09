//
//  LoginPageStruct.swift
//  HiveClient
//
//  Created by Smart Cash on 25.12.2019.
//  Copyright © 2019 Denis Svetlakov. All rights reserved.
//

import Foundation
import Combine

class Login: Codable, ObservableObject{
   
var login = "Sined"
var password = ""
var twofaCode = ""
@Published var accessToken = ""
    
    enum  CodingKeys: String, CodingKey {
        case login
        case password
        case twofaCode = "twofa_code"
        case accessToken = "access_token"
      }
    
  required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try container.decode(String.self, forKey: .accessToken)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(login, forKey: .login)
        try container.encode(password, forKey: .password)
        try container.encode(twofaCode, forKey: .twofaCode)
    }
    init (){}
    }
