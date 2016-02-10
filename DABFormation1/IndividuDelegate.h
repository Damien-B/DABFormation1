//
//  IndividuDelegate.h
//  DABFormation1
//
//  Created by mac mini pprod 3 on 10/02/2016.
//  Copyright © 2016 mac mini pprod 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@protocol IndividuDelegate <NSObject>

@optional
- (void)setIndividuWithDictionary:(NSDictionary *)data;
- (void)setIndividuWithPerson:(Person *)person;

@required
- (void)setDefaultIndividu;

@end
