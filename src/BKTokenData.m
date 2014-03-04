//
// BKTokenData.m
// Licensed under the terms of the BSD License, as specified below.
//

/*
 Copyright (c) 2010, Samuel Mendes
 
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 * Neither the name of ᐱ nor the names of its
 contributors may be used to endorse or promote products derived
 from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import <BayesianKit/BKTokenData.h>

@implementation BKTokenData

- (id)initWithCount:(NSUInteger)aCount
{
    self = [super init];
    if (self) {
        [self setCount:aCount];
    }
    return self;
}

+ (BKTokenData*)tokenDataWithCount:(NSUInteger)aCount
{
    return [[BKTokenData alloc] initWithCount:aCount];
}

#pragma mark -
#pragma mark NSCoding Methods
- (id)initWithCoder:(NSCoder*)coder
{
    self = [super init];
    if (self) {
        _count = [coder decodeIntegerForKey:@"Count"];
        _probability = [coder decodeFloatForKey:@"Probability"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder*)coder
{
    [coder encodeInteger:self.count forKey:@"Count"];
    [coder encodeFloat:self.probability forKey:@"Probability"];
}

#pragma mark -
#pragma mark Custom Setters
- (void)setProbability:(CGFloat)aProbability
{
    _probability = MIN(0.9999f, aProbability);
    _probability = MAX(0.0001f, _probability);
}

#pragma mark -
#pragma mark Comparison Methods
- (NSComparisonResult)compareCount:(BKTokenData*)other
{
    return [[NSNumber numberWithUnsignedInteger:self.count] compare:
            [NSNumber numberWithUnsignedInteger:[other count]]];
}

- (NSComparisonResult)compareProbability:(BKTokenData*)other
{
    return [[NSNumber numberWithFloat:self.probability] compare:
            [NSNumber numberWithFloat:[other probability]]];
}

#pragma mark -
#pragma mark Printing Methods
- (NSString*)description
{
    return [NSString stringWithFormat:@"{count: %lu, probability: %f}", self.count, self.probability];
}

@end
