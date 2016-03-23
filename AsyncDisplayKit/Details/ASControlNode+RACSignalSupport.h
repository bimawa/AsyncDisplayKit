//
//  ASControlNode+RACSignalSupport.h
//  AsyncDisplayKit
//
//  Created by Maksim Bunkow on 23.03.16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ASControlNode (RACSignalSupport)

- (RACSignal *)rac_signalForControlEvents:(ASControlNodeEvent)controlEvents;

@end
