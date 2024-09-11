//
//  CardsView.swift
//  smac
//
//  Created by Sean Velasco on 9/11/24.
//

import SwiftUI
import CoreImage.CIFilterBuiltins


struct CreditCard<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.blue)
            .aspectRatio(1.58577250834, contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .shadow(radius: 8)
            .overlay(content)
    }
}

struct AdvantageCardView: View {
    var body: some View {
        CreditCard {
            
        }
    }
}

struct CardsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(0..<4) { card in
                        AdvantageCardView()
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Cards")
                        .fontWeight(.medium)
                }
                ToolbarItem {
                    Button {
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    CardsView()
}
