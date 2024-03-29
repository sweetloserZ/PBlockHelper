//
//  PBlockHelper.h
//  BlockT
//
//  Created by sweetloser on 2019/8/24.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/*
    code      ｜    Meaning
-----------------------------------------
    c         ｜    A char
-----------------------------------------
    i         ｜    An int
-----------------------------------------
    s         ｜    A short
-----------------------------------------
    l         ｜    A long
-----------------------------------------
    q         ｜    A long long
-----------------------------------------
    C         ｜    An unsigned char
-----------------------------------------
    I         ｜    An unsigned int
-----------------------------------------
    S         ｜    An unsigned short
-----------------------------------------
    L         ｜    An unsigned long
-----------------------------------------
    Q         ｜    An unsigned long long
-----------------------------------------
    f         ｜    A float
-----------------------------------------
    d         ｜    A double
-----------------------------------------
    B         ｜    A C++ bool or a C99 _Bool
-----------------------------------------
    v         ｜    A void
-----------------------------------------
    *         ｜    A character string (char *)
-----------------------------------------
    @         ｜    An object(whether statically typed or typed id)
-----------------------------------------
    #         ｜    A class object (Class
-----------------------------------------
    :         ｜    A method selector (SEL)
-----------------------------------------
[array type]  ｜       A C++ bool or a C99 _Bool
-----------------------------------------
{name=type...}｜       A structure
-----------------------------------------
(name=type...)｜       A union
-----------------------------------------
     bnum     ｜       A bit field of num bits
-----------------------------------------
    ^type     ｜       A pointer to type
-----------------------------------------
     ?        ｜       An unknown type (among other things, this code is used for function pointers)
-----------------------------------------
 
 */

@interface PBlockHelper : NSObject


+(PBlockHelper *)shareInstance;

-(void)PrintBlockinfo:(unsigned long long)blockAddr;

@end

NS_ASSUME_NONNULL_END
