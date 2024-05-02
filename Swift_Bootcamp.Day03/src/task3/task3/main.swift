import Foundation

// необходимые переменные
var server = Server(serverAddress: "www.xxx.com")
var mainProfile = Profile(nickname: "coolpicker", age: 22, name: "swissmer", status: .IDLE, playerActionDelegate: server)
var profile1 = Profile(nickname: "super3228", age: 17, name: "Костя", status: .IDLE, playerActionDelegate: server)
var profile2 = Profile(nickname: "lrdxg", age: 19, name: "Кирилл", status: .SEARCH, playerActionDelegate: server)
var profile3 = Profile(nickname: "kmaw", age: 30, name: "Павел", status: .IN_PLAY, playerActionDelegate: server)
var profile4 = Profile(nickname: "aveelyr", age: 25, name: "София", status: .SEARCH, playerActionDelegate: server)
server.setProfiles(profiles: [profile1, profile2, profile3, profile4, mainProfile])

// информация по заданию
mainProfile.info()
print()
server.info()

let opponent = mainProfile.findOpponent()
server.info()
