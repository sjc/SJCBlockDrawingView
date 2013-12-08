/*
 The MIT License (MIT)
 
 Copyright (c) 2013 Stuart Crook
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 the Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#import "SJCBlockDrawingView.h"

@interface SJCBlockDrawingView () {
    SJCLayoutSubviewsBlock _layoutSubviewsBlock;
    SJCDrawRectBlock _drawRectBlock;
}
@end

@implementation SJCBlockDrawingView

- (void)setLayoutSubviewsBlock:(SJCLayoutSubviewsBlock)block {
    if((_layoutSubviewsBlock = [block copy])) {
        [self setNeedsLayout];
    }
}

- (void)setDrawRectBlock:(SJCDrawRectBlock)block {
    if((_drawRectBlock = [block copy])) {
        [self setNeedsDisplay];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if(_layoutSubviewsBlock) {
        _layoutSubviewsBlock(self);
    }
}

- (void)drawRect:(CGRect)rect {
    if(_drawRectBlock) {
        _drawRectBlock(self, rect);
    }
}

@end
