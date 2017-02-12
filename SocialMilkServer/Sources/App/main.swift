import Vapor

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

drop.post("auth", "vk"){ request in
    return "authorized vk"
}

drop.post("auth", "twitter"){ request in
    return "authorized twitter"
}

drop.post("auth", "facebook"){ request in
    return "authorized facebook"
}

drop.resource("posts", PostController())

drop.run()
