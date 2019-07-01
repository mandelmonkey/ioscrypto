//
//  secureRandom.m
//  ioscrypto
//
//  Created by Chris on 2018/10/14.
//  Copyright © 2018 IndieSquare. All rights reserved.
//

#import "secureRandom.h"

@implementation secureRandom

-(NSString*)generateRandomBytes {
uint8_t randomBytes[16];
int result = SecRandomCopyBytes(kSecRandomDefault, 16, randomBytes);
if(result == 0) {
    NSMutableString *uuidStringReplacement = [[NSMutableString alloc] initWithCapacity:16*2];
    for(NSInteger index = 0; index < 16; index++)
    {
        [uuidStringReplacement appendFormat: @"%02x", randomBytes[index]];
    }
    
    return [NSString stringWithFormat:@"%@",uuidStringReplacement];
    
  
} else {
    NSLog(@"SecRandomCopyBytes failed for some reason");
    return [NSString stringWithFormat:@""];
    
}
    
}
@end
