//
//  ContentView.swift
//  smac
//
//  Created by Sean Velasco on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                HomeView().tabItem {
                    Label("Home", systemImage: "house")
                }
                PerksView().tabItem {
                    Label("Perks", systemImage: "star")
                }
                CardsView().tabItem {
                    Label("Cards", systemImage: "creditcard")
                }
                AccountView().tabItem {
                    Label("Account", systemImage: "person")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
