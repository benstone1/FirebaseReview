import Foundation
import FirebaseFirestore

enum FirestoreError: Error {
    case noSnapshot
    case rawError(Error)
    case unknown
}

class FirebaseService {
    static let manager = FirebaseService()
    
    func makePost(post: Post) {
        db.collection("Posts").document(post.id.uuidString).setData(post.fieldsDict())
    }
    
    func createUser(user: User) {
        db.collection("Users").document(user.id.uuidString).setData(user.fieldsDict())
    }
    
    func getAllPosts(onCompletion: @escaping (Result<[Post], FirestoreError>) -> Void) {
        getAllObjects(atCollectionName: "Posts", onCompletion: onCompletion)
    }
    
    func getAllUsers(onCompletion: @escaping (Result<[User], FirestoreError>) -> Void) {
        getAllObjects(atCollectionName: "Users", onCompletion: onCompletion)
    }
    
    private func getAllObjects<T: FirebaseConvertible>(atCollectionName name: String,
                                                       onCompletion: @escaping (Result<[T], FirestoreError>) -> Void) {
        db.collection(name).getDocuments { (snapshot, error) in
            if let error = error {
                onCompletion(.failure(.rawError(error)))
                return
            }
            guard let snapshot = snapshot else {
                onCompletion(.failure(.noSnapshot))
                return
            }
            let objects = snapshot.documents.compactMap { T(fromFirebaseDict: $0.data()) }
            onCompletion(.success(objects))
        }
    }
        
    private init() {}
    private let db = Firestore.firestore()
}
