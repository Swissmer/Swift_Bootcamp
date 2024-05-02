### Hello!

Mobile app development often involves the use of a network layer.
Let's start with [URLSession](https://developer.apple.com/documentation/foundation/urlsession) - a library, provided by Apple for networking, and also [Alamofire](https://github.com/Alamofire/Alamofire), which is a third-party library for simplified interaction with the network.

## Topics

- HTTP
- URL
- JSONSerialization
- URLSession
- Codable
- Alamofire

## Project

### Information about objects for IOS

Today's project topic is a list of objects. More specifically, an application for getting a list of objects with a description.

## Tasks

**Requirement!** Create a workspace inside the src folder named day07. 
You must create a macOS/Command Line Tool project for each task inside the workspace. For example, day07/quest1, day07/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

**Requirements:** 
1. Use [API from one of the most famous international airports - Schiphol](https://developer.schiphol.nl/). 
2. Describe data models for flights and get data from the service.

 **Tips:** 
1. You need to register to get access to the API.
2. API description is located on the Documentation tab. 
3. Pay attention to the mandatory query parameters. 
4. You can see the Application ID and Application Key on the Applications tab.
5. Do not forget to wait for a response from the server, because the operation is not performed instantly.

**Requirement!** Create a workspace inside the src folder named day07 if using the Swift Packet Manager.
If using Cocoapods, use the generated workspace after the `pod install` command
For each task inside the workspace, you need to create a macOS/Command Line Tool project. For example, day07/quest1, day07/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 0. Create a new project in XCode

### Task 1. Network service protocol

When completing this task you need to:
- Create dto models describing the structure of flight objects with the fields you think are needed, which are received from the server. The object must have at least ten fields.
- Develop a network service protocol IObjectService, which must contain:
    - Information about the base URL
    - A method to get a list of objects with a description. The parameter of the method must be a completion function to which the dto model will be passed, or nil.

It's very important that you understand the [HTTP](https://developer.mozilla.org/ru/docs/Web/HTTP/Overview) protocol and the structure of [URL](https://developer.mozilla.org/ru/docs/Learn/Common_questions/Web_mechanics/What_is_a_URL.) Also, read about [RESTful API](https://restfulapi.net).


### Task 2. Implementing a network service protocol using URLSession

You need to implement the developed IObjectService protocol using URLSession.

- The implementation must be in ObjectURLSessionService
- You must use [dataTask](https://developer.apple.com/documentation/foundation/urlsession/1407613-datatask) method
- To deserialize JSON use [JSONSerialization](https://developer.apple.com/documentation/foundation/jsonserialization)
- For dto models an additional init must be implemented for deserialization
- When you receive a response, the completion function must be called
- If there is an error, nil must be passed to the completion function, and the error itself is output to the console
- There must be an output of the received answer in the console

### Task 3. Implementing a network service protocol using Alamofire

You need to implement the developed IObjectService protocol using Alamofire, and also [Codable](https://developer.apple.com/documentation/swift/codable) for serialization.

- The implementation must be in ObjectAlamofireService
- Dto models must implement the Decodable protocol
- The responseDecodable method must be used for the Alamofire query
- When you receive a response, the completion function must be called
- If there is an error, nil must be passed to the completion function, and the error itself is output to the console
- There must be an output of the received answer in the console
