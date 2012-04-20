//
//  NSURL+Writability.m
//
//  Created by Michael Hörl on 20.04.12.
//  Copyright (c) 2012 Michael Hörl. All rights reserved.
//
//	Licenced under the MIT licence: http://www.opensource.org/licenses/MIT

#import "NSURL+Writability.h"


@implementation NSURL (Writability)

- (BOOL)writeToFile:(NSString *)file withIcon:(NSImage *)icon hideExtension:(BOOL)hide {
	BOOL success = NO;
	
	if (![[file pathExtension] isEqualToString:@"webloc"])
		file = [[file stringByDeletingPathExtension] stringByAppendingPathExtension:@"webloc"];
	
	if (file.length > 0) {
		NSDictionary *linkDict = [NSDictionary dictionaryWithObject:self.absoluteString forKey:@"URL"];
		success = [linkDict writeToURL:[NSURL fileURLWithPath:file] atomically:NO];
		
		if (success && icon)
			success = [[NSWorkspace sharedWorkspace] setIcon:icon forFile:file options:NSExcludeQuickDrawElementsIconCreationOption];
		
		if (success)
			success = [[NSFileManager defaultManager] setAttributes:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:hide] forKey:NSFileExtensionHidden]
													   ofItemAtPath:file
															  error:NULL ];
	}
	
	return success;
}

@end
