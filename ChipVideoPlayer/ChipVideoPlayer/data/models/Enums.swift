import Foundation
import Combine

///
/// LoadingState
///
enum LoadingState<T> {
  case idle
  case loading
  case doneNothing
  case done(T)
  case failure(Error)
}
