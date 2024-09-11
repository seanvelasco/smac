//
//  HomeView.swift
//  smac
//
//  Created by Sean Velasco on 9/11/24.
//

import SwiftUI


struct CardCarouselView: View {
    let cards = [1,2,3]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(cards, id: \.self) { card in
                    AdvantageCardView()
                        .frame(width: 323, height: 204)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .contentMargins(34, for: .scrollContent)
    }
}

struct HomeView: View {
    @State private var points: Double = 0
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    CardCarouselView()
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.blue, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(String(format: "%.2f points", points))
                        .foregroundStyle(.white)
                        .font(.title2)
                        .fontWeight(.medium)
                }
                ToolbarItem {
                    Button {
                        print("")
                    } label: {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}
