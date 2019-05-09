//
//  SA_DSStack.h
//  StackDemo
//
//  Created by sealedace on 2019/5/9.
//  Copyright © 2019 sealedace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SA_DSStack : NSObject

- (instancetype _Nonnull)initWithSize:(NSUInteger)size;

- (id _Nullable)pop;
- (void)push:(id _Nonnull)object;
- (id _Nullable)peek;
- (NSUInteger)sizeOfStack;
- (BOOL)isEmpty;
- (BOOL)isFull;
- (void)clear;
- (NSArray * _Nonnull)allObjectsFromStack;
- (void)compressStack;

@end

NS_ASSUME_NONNULL_END
