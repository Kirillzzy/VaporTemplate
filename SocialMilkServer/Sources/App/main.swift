import Vapor


var vkToken: String? = nil
var twitterToken: String? = nil
var facebookToken: String? = nil

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.get("get", "posts", "all"){ request in
    var posti = VkPost(postId: "1", content: "HELLo", date: "11", url: "abra.com")
    
    return "Got allPosts"
}

drop.get("get", "posts", "vk"){ request in
    let url = "https://api.vk.com/method/newsfeed.get?count=3&access_token=\(vkToken!)&v=5.62"
    let response = try drop.client.get(url)
    print(response)
    return "Got vkPosts"
}

drop.get("get", "posts", "twitter"){ request in
    return "Got twitterPosts"
}

drop.get("get", "posts", "facebook"){ request in
    return "Got facebookPosts"
}

drop.get("get", "checkedposts", "vk"){ request in
    return "Got checkedPosts vk"
}

drop.get("get", "checkedposts", "twitter"){ request in
    return "Got checkedPosts twitter"
}

drop.get("get", "checkedposts", "facebook"){ request in
    return "Got checkedPosts facebook"
}

drop.get("get", "sn"){ request in
    return "Got list of social networks"
}

drop.get("auth", "vk", ":token"){ request in
    guard let token = request.parameters["token"]?.string else {
        throw Abort.badRequest
    }
    vkToken = token
    return "Success"
}

drop.get("auth", "twitter", ":token"){ request in
    guard let token = request.parameters["token"]?.string else {
        throw Abort.badRequest
    }
    twitterToken = token
    return "Success"
}

drop.get("auth", "facebook", ":token"){ request in
    guard let token = request.parameters["token"]?.string else {
        throw Abort.badRequest
    }
    facebookToken = token
    return "Success"
}

drop.resource("posts", PostController())

drop.run()
