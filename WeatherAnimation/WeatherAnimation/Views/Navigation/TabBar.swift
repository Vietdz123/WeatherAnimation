//
//  TabBar.swift
//  WeatherAnimation
//
//  Created by MAC on 31/10/2023.
//

import SwiftUI

struct TabBar: View {
    
    var action: () -> Void
    
    var body: some View {
    
        ZStack(alignment: .center) {
            
            Arc()
                .fill(Color.tabBarBackground)
                .frame(height: 88)
                
            
            HStack(alignment: .center, spacing: 8) {
                
                Button(action: {
                    action()
                }, label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                })
                
                Spacer()
                
                NavigationLink {
                    
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }

            }
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
            
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()

        
    }
}

#Preview {
    TabBar(action: {})
        .preferredColorScheme(.dark)
}
