//
//  HomeView.swift
//  WeatherAnimation
//
//  Created by MAC on 31/10/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                
                // MARK: - Background Color
                Color.background
                    .ignoresSafeArea()
                
                // MARK: - Background Image
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                
                // MARK: - House Image
                Image("House")
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 257)
                
                VStack(alignment: .center, spacing: -1) {
                    Text("Montreal")
                        .font(.largeTitle)
                    
                    VStack(alignment: .center, spacing: 8) {
                        Text("19°")
                            .font(.system(size: 96, weight: .thin))
                            .foregroundColor(.primary)
                        +
                        Text("\n")
                        +
                        Text("  Mostly clear")
                            .font(.title3.weight(.semibold))
                            .foregroundColor(.secondary)
                        
                        Text("H:24°.  L:18°")
                            .font(.title3.weight(.semibold))
                        
                        
                    }
                    
                    Spacer()
                    
                }
                .padding(.top, 58)
                
                // MARK: - TabBar
                TabBar {
                    
                }
            }
        }
        .navigationBarHidden(true)
        
        
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
