//
//  NSObject+PTIntrospection.h
//  PTCategories
//
//  Created by LeeHu on 8/24/17.
//  Copyright © 2017 leehu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PTIntrospection)

+ (NSArray *)pt_classes;

+ (NSArray *)pt_properties;

+ (NSArray *)pt_instanceVariables;

+ (NSArray *)pt_classMethods;

+ (NSArray *)pt_instanceMethods;

+ (NSArray *)pt_protocols;

+ (NSDictionary *)pt_descriptionForProtocol:(Protocol *)proto;

+ (NSString *)pt_parentClassHierarchy;

+ (NSArray<NSString *> *)pt_propertyKeys;

@end
