import Foundation

struct Post: FirebaseConvertible {
    let title: String
    let body: String
    let id: UUID
}
