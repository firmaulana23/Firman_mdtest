//
//  ContentView.swift
//  FAN
//
//  Created by Muhamad Firman Maulana on 01/06/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail: CGFloat = 0
    @State private var isAuthenticated = false
    @State private var showingForgotPassView = false
    @State private var showingRegisterView = false

    var body: some View {
        Group {
            if isAuthenticated {
//                HomePageView()
            } else if showingRegisterView {
                RegisterView()
            } else {
                loginView
            }
        }
    }
    
    var loginView: some View {
        NavigationView {
            ZStack(alignment: .center) {
                BackgroundView()

                VStack {
                    LoginHeader()
                    LoginFields(email: $email, password: $password, wrongEmail: $wrongEmail)
                    HStack(){
                        Spacer()
                        
                        NavigationLink(destination: ForgotPassView()) {
                            Text("Forgot Password?")
                                .foregroundColor(.blue)
                                .frame(width: 250, height: 20)
                                .padding(.leading)
                        }
                    }
                    LoginButton(email: $email, password: $password, isAuthenticated: $isAuthenticated, wrongEmail: $wrongEmail)
                    RegisterButton(showingRegisterPage: $showingRegisterView)
                }
            }
        }
    }

    private func authenticateUser() {
        if email.isEmpty && password.isEmpty {
            isAuthenticated = true
        } else {
            wrongEmail = 2
        }
    }
    
}

struct BackgroundView: View {
    var body: some View {
        Color.yellow
            .ignoresSafeArea()
            .overlay(
                Circle()
                    .scale(1.7)
                    .foregroundColor(.green.opacity(0.3))
            )
            .overlay(
                Circle()
                    .scale(1.5)
                    .foregroundColor(.white)
            )
    }
}

struct LoginHeader: View {
    var body: some View {
        Text("Login")
            .font(.largeTitle)
            .bold()
            .padding()
    }
}

struct ForgotPasswordButton: View {
    @Binding var showingRegisterPage: Bool

    var body: some View {
        Button(action: {
            showingRegisterPage = true
        }) {
            HStack {
                Spacer()
                Text("Forgot Password?")
                    .padding(.trailing)
            }
            .frame(width: 300, height: 20)
            .foregroundColor(.blue)
        }
    }
}

struct LoginFields: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var wrongEmail: CGFloat

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: wrongEmail)
            
            SecureField("Password", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: wrongEmail)
        }
    }
}

struct LoginButton: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var isAuthenticated: Bool
    @Binding var wrongEmail: CGFloat

    var body: some View {
        Button(action: {
            authenticateUser()
        }) {
            Text("Login")
                .padding()
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
        }
        .padding(.top, 55)
    }

    private func authenticateUser() {
        if email.isEmpty && password.isEmpty {
            isAuthenticated = true
        } else {
            wrongEmail = 2
        }
    }
}

struct RegisterButton: View {
    @Binding var showingRegisterPage: Bool

    var body: some View {
        Button(action: {
            showingRegisterPage = true
        }) {
            Text("Register")
                .padding()
                .foregroundColor(.blue)
                .cornerRadius(10)
        }
        .padding(.top, 20)
    }
}

#Preview {
    LoginView()
}
