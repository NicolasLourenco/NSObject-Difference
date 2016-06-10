//
//  NSObject+Difference.m
//  Difference
//
//  Created by Nicolas Lourenco on 10/06/16.
//  Copyright © 2016 Nicolas Lourenco. All rights reserved.
//

#import "NSObject+Difference.h"
#import <objc/runtime.h>

@implementation NSObject (Difference)

- (NSArray *)difference:(id)object
{
    NSMutableArray *difference = [[NSMutableArray alloc] init];
    
    if ([self class] != [object class])
    {
        return difference;
    }
    
    unsigned int outCount, i;
    objc_property_t *selfProperties = class_copyPropertyList ([self class], &outCount);
    
    for (i = 0; i < outCount; i++)
    {
        objc_property_t property = selfProperties[i];
        const char *propName = property_getName (property);
        if (propName)
        {
            NSString *propertyName =
            [NSString stringWithCString:propName
                               encoding:[NSString defaultCStringEncoding]];
            
            id selfValue = [self valueForKey:propertyName];
            id objValue = [self valueForKey:propertyName];
            
            if (![selfValue isEqual:objValue]) {
                [difference addObject:@{propertyName:selfValue}];
            }
        }
    }
    
    free (selfProperties);
    return difference;
}

@end
