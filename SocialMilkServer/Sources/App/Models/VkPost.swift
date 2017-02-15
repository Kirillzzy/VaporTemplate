//
//  VkPost.swift
//  SocialMilkServer
//
//  Created by Kirill Averyanov on 14/02/2017.
//
//

import Vapor
import Fluent
import Foundation

final class VkPost: Model {
    var id: Node?
    var postId: String?
    var content: String?
    var date: String?
    var url: String?
    
    init(postId: String?, content: String?, date: String?, url: String?) {
        self.id = UUID().uuidString.makeNode()
        self.content = content
        self.postId = postId
        self.date = date
        self.url = url
    }
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        content = try node.extract("content")
        postId = try node.extract("postId")
        date = try node.extract("date")
        url = try node.extract("url")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "content": content,
            "postId": postId,
            "date": date,
            "url": url
            ])
    }

    static func prepare(_ database: Database) throws {
        try database.create("vkposts") { vkposts in
            vkposts.id()
            vkposts.string("postId")
            vkposts.string("content")
            vkposts.string("date")
            vkposts.string("url")
        }
    }

    static func revert(_ database: Database) throws {
        try database.delete("vkposts")
    }
}
