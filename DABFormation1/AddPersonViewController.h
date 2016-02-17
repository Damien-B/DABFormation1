//
//  AddPersonViewController.h
//  DABFormation1
//
//  Created by mac mini pprod 3 on 17/02/2016.
//  Copyright © 2016 mac mini pprod 3. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddPersonViewController;

@protocol AddPersonViewControllerDelegate <NSObject>

- (void)addPersonInViewController:(AddPersonViewController *)viewController withDictionary:(NSDictionary *)personDictionary;

@end


@interface AddPersonViewController : UIViewController
@property (nonatomic, weak) id <AddPersonViewControllerDelegate> delegate;
@end
