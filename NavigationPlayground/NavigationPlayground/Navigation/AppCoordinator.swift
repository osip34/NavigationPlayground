//
//  AppCoordinator.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import Foundation
import SwiftUI

@Observable
class AppCoordinator {
    var navigationStackPath: [Destination] = []
    var presentingSheet: Destination?
    var presentingFullScreenCover: Destination?
    
    @ViewBuilder func view(for destination: Destination) -> some View {
        switch destination {
        case .home: AnyView(createView1())
        case .details: AnyView(createView2())
        case .firstCover: AnyView(createView3())
            
        }
    }
    
    func RootView() -> some View {
        NavigationContainer(
            content: { ContentView(onTap: { [weak self] in
                self?.navigateToFirstView()
            }) },
            router: self)
    }
    
    func navigateToFirstView() {
        navigationStackPath.append(.home)
    }
    
    func navigateToDetails() {
        navigationStackPath.append(.details)
    }
    
    func navigateToFirstCover() {
        presentingFullScreenCover = .firstCover
    }
    
    func popToRoot() {
        navigationStackPath.removeAll()
    }
}

enum Destination: Identifiable {
    case home
    case details
    case firstCover

    var id: String {
        switch self {
        case .home: return "home"
        case .details: return "details"
        case .firstCover: return "firstCover"
        }
    }
}

extension AppCoordinator {
    private func createView1() -> some View {
        View1(onNavigate: { [weak self] in
            self?.navigateToDetails()
        }, onClose: { [weak self] in
            self?.popToRoot()
        })
    }
    
    private func createView2() -> some View {
        View2(onNavigate: { [weak self] in
            self?.navigateToFirstCover()
        }, onClose: { [weak self] in
            self?.popToRoot()
        })
    }
    
    private func createView3() -> some View {
        View3(onNavigate: { // [weak self] in
            // self?.navigateToDetails()
        }, onClose: { [weak self] in
            self?.popToRoot()
        })
    }
}
