//
//  Person+PersonAdditions.m
//  DABFormation1
//
//  Created by mac mini pprod 3 on 10/02/2016.
//  Copyright © 2016 mac mini pprod 3. All rights reserved.
//

#import "Person+PersonAdditions.h"

@implementation Person (PersonAdditions)

- (void)swapNomAndPrenom {
    NSString *nom = self.nom;
    self.nom = self.prenom;
    self.prenom = nom;
}

@end
