import Foundation

struct Like: FirebaseConvertible {
    let postID: UUID
    let timestamp: TimeInterval
}
