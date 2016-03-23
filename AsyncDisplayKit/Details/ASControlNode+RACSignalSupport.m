//
//  ASControlNode+RACSignalSupport.m
//  AsyncDisplayKit
//
//  Created by Maksim Bunkow on 23.03.16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "ASControlNode+RACSignalSupport.h"
#import "NSObject+RACDescription.h"

@implementation ASControlNode (RACSignalSupport)

- (RACSignal *)rac_signalForControlEvents:(ASControlNodeEvent)controlEvents {
  @weakify(self);
  
  return [[RACSignal
           createSignal:^(id<RACSubscriber> subscriber) {
             @strongify(self);

             [self addTarget:subscriber action:@selector(sendNext:) forControlEvents:controlEvents];
             [self.rac_deallocDisposable addDisposable:[RACDisposable disposableWithBlock:^{
               [subscriber sendCompleted];
             }]];
             
             return [RACDisposable disposableWithBlock:^{
               @strongify(self);
               [self removeTarget:subscriber action:@selector(sendNext:) forControlEvents:controlEvents];
             }];
           }]
          setNameWithFormat:@"%@ -rac_signalForControlEvents: %lx", self.rac_description, (unsigned long)controlEvents];
}

@end
