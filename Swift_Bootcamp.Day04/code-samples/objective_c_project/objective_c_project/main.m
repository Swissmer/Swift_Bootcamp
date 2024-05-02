//
//  main.m
//  objective_c_project
//
//

#import <Foundation/Foundation.h>
#import "objective_c_project-Swift.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Player *player = [[Player alloc] initWithName:@"John Doe"];
        NSLog(@"Player name: %@", player.name);
    }
    return 0;
}
