//
//  View5.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

struct View5: View {
    let onNavigate: () -> Void
    let onClose: () -> Void
    
    var body: some View {
        ZStack {
            Color.purple.opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("View 5")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Button("Navigate") {
                    onNavigate()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Close") {
                    onClose()
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    View5(onNavigate: {}, onClose: {})
}
