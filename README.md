# Benny Chew App Dev Projects

App development projects by Benny Chew.

## ChipVideoPlayer

### How to run

- Open the API chipvideos-api in Terminal and run npm run dev. If the API is not running, the app will not work properly.
- Run the Xcode project in Xcode 12 or higher with cmd+r.
- If it does not build at first, try changing the Team at Signing & Capabilities to your account.

### App architecture

- MVVM

### Technologies

- Decodable for JSONDecoding.
- Combine publishers for networking (service).
- UIKit UICollectionView diffable data source and compositional layout for the list pages.
- Video player with AVKit. Custom video view with AVFoundation.
- Theme class with a basic design system (colors, font sizes) that works in UIKit and SwiftUI.
- R.swift for generating a type safe 'look up' class for the assets (fonts, images).
- Experiment with a SwiftUI implementation of a page view within the UIKit world (base app uses UINavigationController). Using SwiftUI for some views can save a lot of development time, for situations where the 'old' UIKit features are not needed. Drawback of using SwiftUI is the minimum deployment target has to be iOS 13 or 14.

### External packages

- SnapKit for auto layout.
- Kingfisher for image networking (loading images into UIImageView).
- PanModal (by Slack) for swipable modals. Can be configured to start at half height.

### Next steps for improvement

1. iPad support (responsive design / adaptive layout).
2. Improve custom video player with basic functionality such as pause/play buttons, mute volume button etc.
3. Custom video player rotate device to landscape = fullscreen video (like YouTube).
4. Organize the videos list into sections. Perhaps the first section at the top can have a horizontal slider to make the UI more interesting.
5. Detail page with a custom video player and basic information (if applicable).
6. Settings page.
7. Localization.
8. Search function.
9. Authentication (login module?).
10. Share video.
11. Save to favorites (can use CoreData for saving to device database or with a REST API if favorites needs to be synced across devices).
