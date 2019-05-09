//
//  SA_DSStack.m
//  StackDemo
//
//  Created by sealedace on 2019/5/9.
//  Copyright © 2019 sealedace. All rights reserved.
//

#import "SA_DSStack.h"

static const int kDefaultCapacity = 4;

@interface SA_DSStack()
@property (nonatomic, strong) NSMutableArray *stackArray;
@property (nonatomic, assign) NSUInteger maxStackSize;
@end

@implementation SA_DSStack

#pragma mark - Initialization

- (instancetype _Nonnull)init
{
    self = [super init];
    if (self)
    {
        _stackArray = [[NSMutableArray alloc] initWithCapacity:kDefaultCapacity];
        _maxStackSize = kDefaultCapacity;
        
    }
    
    return self;
}

- (instancetype _Nonnull)initWithSize:(NSUInteger)size
{
    self = [super init];
    if (self)
    {
        if (size > 0)
        {
            _stackArray = [[NSMutableArray alloc] initWithCapacity:size];
            _maxStackSize = size;
        }
        else
        {
            NSAssert(size != 0, @"Stack size must be greater than 0");
        }
    }
    return self;
}

#pragma mark - Public

- (BOOL)isFull
{
    return ([self sizeOfStack] >= self.maxStackSize);
}

- (BOOL)isEmpty
{
    return (self.stackArray.count == 0);
}

- (NSUInteger)sizeOfStack
{
    return self.stackArray.count;
}

- (id)peek
{
    if ([self.stackArray count] > 0)
    {
        return [self.stackArray lastObject];
    }
    
    return nil;
}

- (void)push:(id _Nonnull)object
{
    if ([self isFull] && self.maxStackSize > 0)
    {
        NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:self.maxStackSize*2];
        self.stackArray = [newArray mutableCopy];
        self.maxStackSize = self.maxStackSize * 2;
    }
    
    if (nil != object)
    {
        [self.stackArray addObject:object];
    }
    else
    {
        NSAssert(object != nil, @"You cannot push nil object to stack.");
    }
}

- (id _Nullable)pop
{
    id object = [self peek];
    if (object != nil)
    {
        [self.stackArray removeLastObject];
    }
    
    return object;
}

- (void)clear
{
    [self.stackArray removeAllObjects];
}

- (NSArray * _Nonnull)allObjectsFromStack
{
    NSMutableArray *buffer = [NSMutableArray array];
    for (id object in self.stackArray)
    {
        [buffer addObject:object];
    }
    
    return [buffer copy];
}

- (void)compressStack
{
    NSUInteger capacitySize = (NSUInteger)(self.maxStackSize * 0.9);
    NSUInteger stackSize = self.stackArray.count;
    if (stackSize < capacitySize)
    {
        NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:stackSize];
        for (id object in self.stackArray)
        {
            [newArray addObject:object];
        }
        self.stackArray = newArray;
        self.maxStackSize = stackSize;
    }
}

@end
