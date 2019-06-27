//
//  NSBundle+LanguageChange.m
//  NPExplorer
//
//  Created by niloy.chakraborty on 27/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

#import "NSBundle+LanguageChange.h"
#import <Objc/runtime.h>

#ifdef MARKET_IR
#import "NPExplorer_IR-Swift.h"
#else MARKET_GR
#import "NPExplorer_GR-Swift.h"
#endif

@implementation NSBundle (LanguageChange)

+(void) load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], @selector(localizedStringForKey:value:table:));
        Method swizzledMethod = class_getInstanceMethod([self class], @selector(swizzled_localizedStringForKey:value:table:));
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (NSString *) swizzled_localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    NSString *localizedString = [self swizzled_localizedStringForKey:key value:value table:tableName];
    if (![[self bundlePath] hasSuffix:@"lproj"]) {
        //Get the lang code for run time change initiated by user
        NSString *languageCode =  [LangConfig currentLanguageCode];
        NSString *path = [self pathForResource:languageCode ofType:@"lproj"];
        if (path) {
            NSBundle *bundle = [[NSBundle alloc] initWithPath:path];
            if (bundle) {
                localizedString = [bundle swizzled_localizedStringForKey:key value:value table:tableName];
            }
        }
    }
    return localizedString;
}

@end
