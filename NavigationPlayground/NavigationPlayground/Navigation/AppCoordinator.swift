//
//  AppCoordinator.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import Foundation
import SwiftUI

@Observable
class AppCoordinator: Coordinator {
    var rootState = NavigationState()
    
    private let viewFactory: ViewFactory
    
    init(viewFactory: ViewFactory = DefaultViewFactory()) {
        self.viewFactory = viewFactory
    }
    
    func view(for destination: Destination, state: NavigationState) -> AnyView {
        let view: AnyView
        
        switch destination {
        case .home:
            view = viewFactory.makeView1(
                onNavigate: { [weak self] in self?.navigateToDetails(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .details:
            view = viewFactory.makeView2(
                onNavigate: { [weak self] in self?.navigateToFirstCover(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .firstCover:
            view = viewFactory.makeView3(
                onNavigate: { [weak self] in self?.navigateToSecondCover(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .secondCover:
            view = viewFactory.makeView4(
                onNavigate: { [weak self] in self?.navigateToThirdDestination(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .thirdDestination:
            view = viewFactory.makeView5(
                onNavigate: {},
                onClose: { [weak self] in self?.backToRoot() }
            )
        }
        
        return view
    }
    
    func RootView() -> AnyView {
        AnyView(NavigationContainer(
            content: { ContentView(onTap: { [weak self] in
                self?.navigateToFirstView()
            }) },
            router: self,
            state: rootState))
    }
    
    func navigateToFirstView() {
        rootState.navigationStackPath.append(.home)
    }
    
    func navigateToDetails(state: NavigationState) {
        state.navigationStackPath.append(.details)
    }
    
    func navigateToFirstCover(state: NavigationState) {
        state.fullScreenCoverState = NavigationState()
        state.presentingFullScreenCover = .firstCover
    }
    
    func navigateToSecondCover(state: NavigationState) {
        state.sheetState = NavigationState()
        state.presentingSheet = .secondCover
    }
    
    func navigateToThirdDestination(state: NavigationState) {
        state.navigationStackPath.append(.thirdDestination)
    }
    
    func backToRoot() {
        // Reset root state
        rootState.navigationStackPath.removeAll()
        rootState.presentingSheet = nil
        rootState.presentingFullScreenCover = nil
        rootState.sheetState = nil
        rootState.fullScreenCoverState = nil
    }
}

enum Destination: String, Identifiable {
    case home
    case details
    case firstCover
    case secondCover
    case thirdDestination

    var id: String {
        return self.rawValue
    }
}
