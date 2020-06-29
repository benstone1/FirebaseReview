//
//  ViewController.swift
//  FirebaseReviewLesson
//
//  Created by Benjamin Stone on 6/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getPosts()
        getUsers()
    }
    private func addPosts() {
        FirebaseService.manager.makePost(post: Post(title: "Hi", body: "body", id: UUID()))
        FirebaseService.manager.makePost(post: Post(title: "Hi2", body: "body2", id: UUID()))
    }
    private func addUsers() {
        FirebaseService.manager.createUser(user: User(name: "Username1", email: "email1@gmail.com", id: UUID()))
        FirebaseService.manager.createUser(user: User(name: "Username2", email: "email2@gmail.com", id: UUID()))
    }
    
    private func getPosts() {
        FirebaseService.manager.getAllPosts { (result) in
            switch result {
            case let .success(posts): print(posts)
            case let .failure(error): print(error)
            }
        }
    }
    private func getUsers() {
        FirebaseService.manager.getAllUsers { (result) in
            switch result {
            case let .success(users): print(users)
            case let .failure(error): print(error)
            }
        }
    }
}

