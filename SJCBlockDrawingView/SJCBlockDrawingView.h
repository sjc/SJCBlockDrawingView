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

//
// The last UIView subclass you will ever need ;) Takes blocks which are
// executed when -layoutSubviews and -drawRect: are called.
//

#import <UIKit/UIKit.h>

typedef void(^SJCLayoutSubviewsBlock)(UIView *view);
typedef void(^SJCDrawRectBlock)(UIView *view, CGRect rect);

@interface SJCBlockDrawingView : UIView

/*
 Set the block used to layout the view's subviews. [super layoutSubviews]
 will be called prior to invocation. Use the 'view' property passed to
 your block to access the view, in the same way you would use 'self'.
 @param block The block to execute to layout the view's subviews, or nil
 */
- (void)setLayoutSubviewsBlock:(SJCLayoutSubviewsBlock)block;

/*
 Set the block used to render the view's graphics context. Use the 'view'
 property passed to your block to access the view, in the same way you 
 would use 'self'.
 @param block The block to execute to render the view's graphics context, 
 or nil
 */
- (void)setDrawRectBlock:(SJCDrawRectBlock)block;

@end
