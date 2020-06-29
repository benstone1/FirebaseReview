import Foundation

struct User: FirebaseConvertible {
    let name: String
    let email: String
    let id: UUID
}
