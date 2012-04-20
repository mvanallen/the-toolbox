//
//  NSURL+Writability.h
//
//  Created by Michael Hörl on 20.04.12.
//  Copyright (c) 2012 Michael Hörl. All rights reserved.
//
//	Licenced under the MIT licence: http://www.opensource.org/licenses/MIT

#import <Foundation/Foundation.h>

@interface NSURL (Writability)
- (BOOL)writeToFile:(NSString *)file withIcon:(NSImage *)icon hideExtension:(BOOL)hide;
@end
