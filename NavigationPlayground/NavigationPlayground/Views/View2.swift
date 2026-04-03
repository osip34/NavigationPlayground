//
//  View2.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

struct View2: View {
    var onNavigate: (() -> Void)
    var onClose: (() -> Void)
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("View 2")
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
    View2(onNavigate: {}, onClose: {})
}
