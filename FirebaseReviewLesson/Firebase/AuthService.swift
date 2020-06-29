import Foundation
import FirebaseAuth

enum AuthError: Error {
    case noResult
    case unknown
}

class AuthService {
    static let manager = AuthService()
   
    func registerUser(withEmail email: String, andPassword password: String, onCompletion: @escaping (Result<FirebaseAuth.User, AuthError>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let result = result else { onCompletion(.failure(.noResult)); return }
            onCompletion(.success(result.user))
        }
    }
    
    var currentUser = Auth.auth().currentUser
    
    private init() {}
}
