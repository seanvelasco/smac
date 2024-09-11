//
//  AccountView.swift
//  smac
//
//  Created by Sean Velasco on 9/11/24.
//

import SwiftUI

struct ProfileSettingsView: View {
    @State private var name = ""
    var body: some View {
        Form {
            TextField("Name", text: $name)
        }
    }
}

struct SecuritySettingsView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    var body: some View {
        Form {
            Section {
                TextField("Email", text: $email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
            }
            Section {
                SecureField("Password", text: $password)
                SecureField("Confirm Password", text: $confirmPassword)
            }
        }
    }
}

struct AccountView: View {
    @State var enableCardQuickAccess = true
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink(destination: ProfileSettingsView()) {
                        Text("Profile")
                    }
                    NavigationLink(destination: SecuritySettingsView()) {
                        Text("Security")
                    }
                }
                Section {
                    Toggle(isOn: $enableCardQuickAccess) {
                        Text("Quick Access Virtual Card")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                } footer: {
                    Text("Quickly access virtual card without authenticating")
                }
                Section {
                    NavigationLink(destination: EmptyView()) {
                        Text("Help Center")
                    }
                }
                Button(action: {}) {
                    Text("Logout")
                        .foregroundColor(.red)
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    AccountView()
}
