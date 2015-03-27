//
//  Created by William on 2/2/10.
//  Copyright (c) 2010 JNYJ. All rights reserved.
//
#warning JNYJ KeyChain NEED ADD Security.framework

@interface JNYJKeyChain : NSObject

#pragma mark Save AND Store to Keychain.

+ (NSString *)getSecureValueForKey:(NSString *)key;
+ (BOOL)storeSecureValue:(NSString *)value forKey:(NSString *)key;
@end
