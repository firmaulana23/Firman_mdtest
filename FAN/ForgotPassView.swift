//
//  RegisterView.swift
//  FAN
//
//  Created by Muhamad Firman Maulana on 01/06/24.
//

import Foundation

import SwiftUI

struct ForgotPassView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var passwordMatch = false
    @State private var passwordAlert = "Passwords do not match"
    @State private var emptyData: CGFloat = 0
    @State private var showingLoginView = false
    
    var body: some View{
        if showingLoginView {
            LoginView()
        } else {
            registrationView
        }
    }
    
    var registrationView: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            Color.yellow.ignoresSafeArea()
            VStack {
                Text("Forgot Password")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 60)
                
                Spacer()
                    .frame(height: 60)
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 60)
                    .background(Color.white)
                    .cornerRadius(10)
                    .border(.red, width: emptyData)
                
                Spacer().frame(height: 15)
                
                SecureField("Password", text: $password)
                    .onChange(of: password,initial: true){
                        _,_   in checkPasswords()
                    }
                    .padding()
                    .frame(width: 300, height: 60)
                    .background(Color.white)
                    .cornerRadius(10)
                    .border(.red, width: emptyData)
                
                Spacer().frame(height: 15)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .onChange(of: confirmPassword,initial: true){
                        _,_   in checkPasswords()
                    }
                    .padding()
                    .frame(width: 300, height: 60)
                    .background(Color.white)
                    .cornerRadius(10)
                    .border(.red, width: emptyData)
                
                if passwordMatch {
                    Text(passwordAlert)
                        .frame(height: 50)
                        .opacity(0)
                } else {
                    Text(passwordAlert)
                        .frame(height: 50)
                        .foregroundStyle(Color(.red))
                    
                }
                
                Button(action: {
                    showingLoginView = true
                    
                }) {
                    if (!email.isEmpty && !password.isEmpty && passwordMatch){
                        Text("Reset")
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    } else {
                        Text("Reset")
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.gray)
                            .disabled(true)
                            .cornerRadius(10)
                    }
                }
                
                .disabled(email.isEmpty || password.isEmpty || confirmPassword.isEmpty || !passwordMatch)
                .padding(.top, 20)
                
            }
        }
    }

    private func checkPasswords() {
        passwordMatch = password == confirmPassword
    }

}
