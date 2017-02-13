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
    return "Got allPosts"
}

drop.get("get", "posts", "vk"){ request in
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

drop.post("auth", "vk", ":token"){ request in
//    let id = "5759522"
//    let secret = "q4MIawN5bZwdcjaER7cs"
//    let response = try drop.client.get(pathReq)
//    return response//"authorized vk"
    guard let token = request.parameters["token"]?.string else {
        throw Abort.badRequest
    }
    vkToken = token
    return "Success"
}

drop.post("auth", "twitter"){ request in
    guard let token = request.parameters["token"]?.string else {
        throw Abort.badRequest
    }
    twitterToken = token
    return "Success"
}

drop.post("auth", "facebook"){ request in
    guard let token = request.parameters["token"]?.string else {
        throw Abort.badRequest
    }
    facebookToken = token
    return "Success"
}

drop.resource("posts", PostController())

drop.run()
