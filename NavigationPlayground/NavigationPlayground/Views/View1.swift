//
//  View1.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

struct View1: View {
    var onNavigate: (() -> Void)
    var onClose: (() -> Void)
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("View 1")
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
    View1(onNavigate: {}, onClose: {})
}
