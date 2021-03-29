import Foundation

let API_DOMAIN = "http://localhost:1337"
// let API_DOMAIN = "https://chipvideos-api.herokuapp.com"

///
/// VideoSection
///
struct VideoSection: Hashable {
  let id = UUID()
  var title: String
  var items: [Video]
  var isExpanded: Bool = false
}

///
/// Video
///
struct Video: Decodable, Hashable {
  var id: Int
  var title: String
  var subTitle: String
  var dateUpdated: Date
  var previewImage: PreviewImage?
  var demoVideo: DemoVideo?

  enum CodingKeys: String, CodingKey {
    case id
    case title
    case subTitle = "category"
    case dateUpdated = "updated_at"
    case previewImage
    case demoVideo = "video"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(Int.self, forKey: .id)
    self.title = (try? container.decode(String.self, forKey: .title)) ?? "Title"
    self.subTitle = (try? container.decode(String.self, forKey: .subTitle)) ?? "Category"
    self.dateUpdated = try container.decode(Date.self, forKey: .dateUpdated)
    self.previewImage = (try? container.decode(PreviewImage.self, forKey: .previewImage)) ?? nil
    self.demoVideo = (try? container.decode(DemoVideo.self, forKey: .demoVideo)) ?? nil
  }

  /// PreviewImage
  struct PreviewImage: Decodable, Hashable {
    var id: Int
    var title: String
    var imageUrl: URL

    enum CodingKeys: String, CodingKey {
      case id
      case title = "name"
      case imageUrl = "url"
    }

    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.id = try container.decode(Int.self, forKey: .id)
      self.title = (try? container.decode(String.self, forKey: .title)) ?? "Title"
      let path = (try? container.decode(String.self, forKey: .imageUrl)) ?? "blank.png"
      self.imageUrl = URL(string: "\(API_DOMAIN)\(path)")!
    }
  }

  /// DemoVideo
  struct DemoVideo: Decodable, Hashable {
    var id: Int
    var title: String
    var videoUrl: URL

    enum CodingKeys: String, CodingKey {
      case id
      case title = "name"
      case videoUrl = "url"
    }

    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.id = try container.decode(Int.self, forKey: .id)
      self.title = (try? container.decode(String.self, forKey: .title)) ?? "Title"
      let path = (try? container.decode(String.self, forKey: .videoUrl)) ?? "blank.mp4"
      self.videoUrl = URL(string: "\(API_DOMAIN)\(path)")!
    }
  }
}
