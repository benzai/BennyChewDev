import Foundation
import Combine

///
/// NetworkError
///
enum NetworkError: Error {
  case bad
}

///
/// VideoAPIService
///
class VideoAPIService {
  private lazy var decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
//    decoder.dateDecodingStrategy = .iso8601
    return decoder
  }()
}

// MARK: - Actions

extension VideoAPIService {
  /// Get Videos
  func getVideos() -> AnyPublisher<[Video], Error> {
    let endpoint = videosEndpoint()
    return URLSession.shared.dataTaskPublisher(for: endpoint)
      .tryMap { response in
        guard let httpUrlRes = response.response as? HTTPURLResponse,
              httpUrlRes.statusCode == 200
        else {
          throw NetworkError.bad
        }
        return response.data
      }
      .decode(type: [Video].self, decoder: decoder)
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }

  /// Get Video
  func getVideo(by id: Int) -> AnyPublisher<Video, Error> {
    let endpoint = videoEndpoint(id: id)
    return URLSession.shared.dataTaskPublisher(for: endpoint)
      .tryMap { response in
        guard let httpUrlRes = response.response as? HTTPURLResponse,
              httpUrlRes.statusCode == 200
        else {
          throw NetworkError.bad
        }
        return response.data
      }
      .decode(type: Video.self, decoder: decoder)
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}

// MARK: - Endpoint Helpers

private extension VideoAPIService {
  func videosEndpoint() -> URL {
    var components = urlComponentsLocal()
    components.path = "/videos"
    return components.url!
  }

  func videoEndpoint(id: Int) -> URL {
    var components = urlComponentsLocal()
    components.path = "/videos/\(id)"
    return components.url!
  }

  func urlComponentsLocal() -> URLComponents {
    var components = URLComponents()
    components.scheme = "http"
    components.host = "localhost"
    components.port = 1337
    return components
  }

  func urlComponentsRemote() -> URLComponents {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "chipvideos-api.herokuapp.com"
    return components
  }
}
