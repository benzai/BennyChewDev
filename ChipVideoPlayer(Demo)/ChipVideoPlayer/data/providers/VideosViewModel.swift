import Foundation
import Combine
import SwiftUI

///
/// VideosViewModel
///
class VideosViewModel: ObservableObject {
  typealias Section = VideoSection
  typealias Entity = Video

  private var subs = Set<AnyCancellable>()

  // State
  @Published var loadingState: LoadingState<[Section]> = .idle
  @Published var detailLoadingState: LoadingState<Entity> = .idle

  @Published var shitName = "Yuki"
  @Published var color: Color = .red

  // Init
  private let service: VideoAPIService

  init(service: VideoAPIService) {
    self.service = service
  }
}

// MARK: - Actions

extension VideosViewModel {
  func changeName(to name: String) {
    shitName = name
    color = .green
  }

  func fetch() {
    loadingState = .loading
    service.getVideos()
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] completion in
        switch completion {
        case .finished: break
        case .failure(let error): self?.loadingState = .failure(error)
        }
      }, receiveValue: { [weak self] videos in
        let sections = [Section(title: "Section", items: videos)]
        self?.loadingState = videos.count == 0 ? .doneNothing : .done(sections)
      })
      .store(in: &subs)
  }

  func fetch(by id: Int) {
    detailLoadingState = .loading
    service.getVideo(by: id)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] completion in
        switch completion {
        case .finished: break
        case .failure(let error): self?.detailLoadingState = .failure(error)
        }
      }, receiveValue: { [weak self] video in

        self?.detailLoadingState = .done(video)
      })
      .store(in: &subs)
  }
}

// MARK: - Mock Data

extension VideosViewModel {
//  static func mockSections() -> [Section] {
//    [
//      Section(
//        title: "Boys",
//        items: [
//          Entity(title: "Puang"),
//        ]
//      ),
//      Section(
//        title: "Girls",
//        items: [
//          Entity(title: "Puang"),
//        ]
//      ),
//    ]
//  }
}
