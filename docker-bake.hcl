group "default" {
    targets = [
        "webdav",
    ]
}

group "release" {
    targets = [
        "webdav-release",
    ]
}

# -------------------------------------

variable "REPO_PREFIX" {
    default = "devinrsmith/"
}

variable "IMAGE_NAME" {
    default = "webdav"
}

variable "CACHE_PREFIX" {
    default = "deephaven-webdav-"
}

# -------------------------------------

target "webdav" {
    context = "webdav/"
    tags = [
        "${REPO_PREFIX}${IMAGE_NAME}:latest"
    ]
}

# -------------------------------------

target "webdav-release" {
    inherits = [ "webdav" ]
    cache-from = [ "type=gha,scope=${CACHE_PREFIX}webdav" ]
    cache-to = [ "type=gha,mode=max,scope=${CACHE_PREFIX}webdav" ]
    platforms = [ "linux/amd64", "linux/arm64" ]
}

# -------------------------------------
