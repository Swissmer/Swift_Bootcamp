//
//  Player.h
//  swift-project
//
//

#import <Foundation/Foundation.h>
@interface Player : NSObject
    @property (nonatomic, strong) NSString *name;
    -(instancetype)initWithName:(NSString *)name;
@end

