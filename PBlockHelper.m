//
//  PBlockHelper.m
//  BlockT
//
//  Created by sweetloser on 2019/8/24.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import "PBlockHelper.h"

typedef struct Block_Layout {
    void *isa; // initialized to &_NSConcreteStackBlock or &_NSConcreteGlobalBlock
    int flags;
    int reserved;
    void (*invoke)(void *, ...);
    struct Block_descriptor {
        unsigned long int reserved;         // NULL
        unsigned long int size;         // sizeof(struct Block_literal_1)
        // optional helper functions
        void (*copy_helper)(void *dst, void *src);     // IFF (1<<25)
        void (*dispose_helper)(void *src);             // IFF (1<<25)
        // required ABI.2010.3.16
        const char *signature;                         // IFF (1<<30)
    } *descriptor;
    // imported variables
} Block_Layout;

@implementation PBlockHelper

-(void)PrintBlockinfo:(unsigned long long)blockAddr;
{
    Block_Layout *bLayout = (Block_Layout *)blockAddr;
    
    //判断BLOCK_HAS_SIGNATURE：
    NSMethodSignature *signature = nil;
    if((bLayout->flags & (1<<30)) != 0x0) {
        
        //判断BLOCK_HAS_COPY_DISPOSE
        if ((bLayout->flags & (1<<25)) != 0x0) {
            //存在
            signature = [NSMethodSignature signatureWithObjCTypes:bLayout->descriptor->signature];
        }else{
            const  char *signatureTypes = (const char *)(bLayout->descriptor->copy_helper);
            signature = [NSMethodSignature signatureWithObjCTypes:signatureTypes];
        }
    }
    
    if (signature != nil) {
        
        printf("%s<0x%llx>:\nblock_signature:\n%s\n",[(__bridge NSObject *)(*(void **)blockAddr) description].UTF8String,blockAddr,[signature.debugDescription UTF8String]);
    }else{
        printf("has no signature!!!");
    }
    
}


-(instancetype)init;
{
    if (self = [super init]) {
        
    }
    return self;
}
+(PBlockHelper *)shareInstance;
{
    static PBlockHelper *pbHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (pbHelper == nil) {
            pbHelper = [[PBlockHelper alloc] init];
        }
    });
    return pbHelper;
}


@end
