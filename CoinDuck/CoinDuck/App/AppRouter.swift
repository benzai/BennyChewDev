import Combine
import SwiftUI
import UIKit

///
/// AppRouter
///
final class AppRouter: ObservableObject {
  @Published var isPresented: Bool = false
  @Published var isPushed: Bool = false

  private var activeModal: ModalRoute? = nil {
    didSet {
      isPresented = true
    }
  }

  @Published var activePush: PushRoute? = nil {
    didSet {
      isPushed = true
    }
  }

  func modal() -> some View {
    switch activeModal {
    case .favoritesList(let viewModel): return AC.shared.collectionsListPage(viewModel: viewModel).eraseToAnyView()
    case .none: return EmptyView().eraseToAnyView()
    }
  }

//  func pushView() -> some View {
//    switch activePush {
//    case .settingsPicker_theme:
//      print("PUSH")
//      return EmptyView().eraseToAnyView()
//
//    case .settingsPicker_currecy:
//      return EmptyView().eraseToAnyView()
//
//    case .none: return EmptyView().eraseToAnyView()
//    }
//  }
}

// MARK: - Actions

extension AppRouter {
  func presentModal(_ route: ModalRoute) {
    activeModal = route
  }

  func push(_ route: PushRoute) {
    activePush = route
  }
}

// MARK: - Config

extension AppRouter {
  enum ModalRoute {
    case favoritesList(viewModel: CoinViewModel)
  }

  enum PushRoute: Hashable {
    case settingsPicker_theme
    case settingsPicker_currecy
  }
}
