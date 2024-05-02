//
//  Player.m
//  swift-project
//
//

#import <Foundation/Foundation.h>
#import "Player.h"
@implementation Player
    -(instancetype) initWithName:(NSString *) name {
        self = [super init];
        if (self) {
            _name = name;
        }
        return self;
    }
@end

