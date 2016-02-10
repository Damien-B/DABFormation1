//
//  Person.m
//  DABFormation1
//
//  Created by mac mini pprod 3 on 10/02/2016.
//  Copyright © 2016 mac mini pprod 3. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)logInformationsForIndividu:(Person *)person {
    NSString *sexeLabel = [person.sexe isEqualToString:@"homme"] ? @"un homme" : @"une femme";
    NSLog(@"%@ %@ est %@ de %@ ans qui mesure %@", person.prenom, person.nom, sexeLabel, person.age, person.taille);
}

@end
