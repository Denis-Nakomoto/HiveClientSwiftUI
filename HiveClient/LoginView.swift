//
//  LoginView.swift
//  HiveClient
//
//  Created by Smart Cash on 14.01.2020.
//  Copyright © 2020 Denis Svetlakov. All rights reserved.
//

import SwiftUI
import SwiftKeychainWrapper

struct LoginView: View {
    @EnvironmentObject var loginStruct: Login
    @State var showAlert = false
    @State var isLoggedIn = false
    
    var loginIsValid: Bool {
        if self.loginStruct.login.isEmpty || self.loginStruct.password.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Image("Hive")
                            .resizable()
                            .aspectRatio(contentMode: ContentMode.fit)
                            .frame(width: 74.0, height: 74.0)
                        Text ("Hive OS")
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                    Text("Enter your account")
                        .bold()
                        .font(.body)
                        .foregroundColor(.white)
                    VStack{
                        TextField("Login or email", text: self.$loginStruct.login)
                            .padding()
                            .background(Color(red: 1, green: 1, blue: 0.5))
                            .cornerRadius(4.0)
                            .padding(EdgeInsets(top: 0.1, leading: 15, bottom: 15, trailing: 15))
                        SecureField("Password", text: self.$loginStruct.password)
                            .padding()
                            .background(Color(red: 1, green: 1, blue: 0.5))
                            .cornerRadius(4.0)
                            .padding(EdgeInsets(top: 0.1, leading: 15, bottom: 15, trailing: 15))
                        TextField("TwoFA code (if enabled)", text: self.$loginStruct.twofaCode)
                            .padding()
                            .background(Color(red: 1, green: 1, blue: 0.5))
                            .cornerRadius(4.0)
                            .padding(EdgeInsets(top: 0.1, leading: 15, bottom: 15, trailing: 15))
                    } .padding(EdgeInsets(top: 0, leading: 20, bottom: 70, trailing: 20))
                    Button (action: {
                        self.sendRequest()
                        self.loginPass()
                    })
                    { HStack(alignment: .center) {
                        Spacer()
                        Text("Login")
                            .foregroundColor(.blue)
                            .bold()
                        Spacer()
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(4.0)
                    .padding(EdgeInsets(top: 0.1, leading: 100, bottom: 10, trailing: 100))
                    }
                }
                NavigationLink(destination: FarmView(), isActive: self.$isLoggedIn)
                {
                    Text ("")
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .keyboardResponsive()
                //MARK: - Alert
                .alert(isPresented: $showAlert) {
                    Alert (title: Text ("Message"), message: Text("Name or password is empty"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    //MARK: - Sending HTTP request and recieving the response
    
    func sendRequest() {
        if self.loginIsValid == false {
            self.showAlert.toggle()
        } else {
            guard let encoded = try? JSONEncoder().encode(loginStruct) else {
                print ("Fail to send the token request")
                return
            }
            let url = URL(string: "https://api2.hiveos.farm/api/v2/auth/login")!
            var request = URLRequest (url: url)
            request.addValue("application/json", forHTTPHeaderField: "content-type")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            request.httpMethod = "POST"
            request.httpBody = encoded
            URLSession.shared.dataTask(with: request) {
                guard let data = $0 else {
                    print ("No data in response:\($2?.localizedDescription ?? "Unknown error").")
                    return
                }
                // MARK: - Parse data
                if let decoded = try? JSONDecoder().decode(Login.self, from: data){
                    DispatchQueue.main.async {
                        self.loginStruct.accessToken = decoded.accessToken
                        let _ = KeychainWrapper.standard.set (self.loginStruct.accessToken, forKey: "accessToken")
                        self.loginPass()
                        print("Token: \(self.loginStruct.accessToken)")
                        print("IsLogedIn: \(self.isLoggedIn)")
                    }
                } else {
                    let dataString = String(decoding: data, as: UTF8.self)
                    print("Data: \(dataString)")
                }
            }.resume()
        }
    }
    
    //MARK: -  Checking if the access token is recieved
    
    func loginPass() {
        if self.loginStruct.accessToken.isEmpty {
            self.isLoggedIn = false
        } else {
            self.isLoggedIn = true
        }
    }
}
