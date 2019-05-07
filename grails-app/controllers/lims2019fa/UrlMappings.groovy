package lims2019fa

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/indexLims2019fa")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
