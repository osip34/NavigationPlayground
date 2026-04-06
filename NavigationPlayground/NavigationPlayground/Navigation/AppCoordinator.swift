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
    
    private let viewFactory: ViewFactory
    
    init(viewFactory: ViewFactory = DefaultViewFactory()) {
        self.viewFactory = viewFactory
    }
    
    @ViewBuilder func view(for destination: Destination) -> some View {
        switch destination {
        case .home:
            viewFactory.makeView1(
                onNavigate: { [weak self] in self?.navigateToDetails() },
                onClose: { [weak self] in self?.popToRoot() }
            )
        case .details:
            viewFactory.makeView2(
                onNavigate: { [weak self] in self?.navigateToFirstCover() },
                onClose: { [weak self] in self?.popToRoot() }
            )
        case .firstCover:
            viewFactory.makeView3(
                onNavigate: {},
                onClose: { [weak self] in self?.popToRoot() }
            )
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
