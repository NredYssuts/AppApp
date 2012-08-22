/*
 Copyright (c) 2012 T. Chroma, M. Herzog, N. Pannuto, J.Pittman, R. Rottmann, B. Sneed, V. Speelman
 The AppApp source code is distributed under the The MIT License (MIT) license.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
 associated documentation files (the "Software"), to deal in the Software without restriction,
 including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial
 portions of the Software.
 
 Any end-user product or application build based on this code, must include the following acknowledgment:
 
 "This product includes software developed by the original AppApp team and its contributors", in the software
 itself, including a link to www.app-app.net.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 DEALINGS IN THE SOFTWARE.
*/

#import "NSDate+ANExtensions.h"

@implementation NSDate (ANExtensions)

- (NSString *)stringInterval
{
    // Get the system calendar
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    
    // Create the current date
    NSDate *currentDate = [[NSDate alloc] init];
    
    // Get conversion to months, days, hours, minutes
    unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit;
    
    NSDateComponents *breakdownInfo = [sysCalendar components:unitFlags fromDate:currentDate  toDate:self  options:0];
    
    //NSLog(@"Break down: %dmin %dhours %ddays %dmoths",[breakdownInfo minute], [breakdownInfo hour], [breakdownInfo day], [breakdownInfo month]);
    
    NSString *intervalString;
    if ([breakdownInfo month]) {
        if (-[breakdownInfo month] > 1)
            intervalString = [NSString stringWithFormat:@"%dM", -[breakdownInfo month]];
        else
            intervalString = @"1M";
    }
    else if ([breakdownInfo day]) {
        if (-[breakdownInfo day] > 1)
            intervalString = [NSString stringWithFormat:@"%dd", -[breakdownInfo day]];
        else
            intervalString = @"1d";
    }
    else if ([breakdownInfo hour]) {
        if (-[breakdownInfo hour] > 1)
            intervalString = [NSString stringWithFormat:@"%dh", -[breakdownInfo hour]];
        else
            intervalString = @"1h";
    }
    else {
        if (-[breakdownInfo minute] > 1)
            intervalString = [NSString stringWithFormat:@"%dm", -[breakdownInfo minute]];
        else
            intervalString = @"1m";
    }
    
    return intervalString;
}
@end
