//
//  AddPersonViewController.m
//  DABFormation1
//
//  Created by mac mini pprod 3 on 17/02/2016.
//  Copyright © 2016 mac mini pprod 3. All rights reserved.
//

#import "AddPersonViewController.h"

@interface AddPersonViewController ()
@property (weak, nonatomic) IBOutlet UITextField *prenomTF;
@property (weak, nonatomic) IBOutlet UITextField *nomTF;
@property (weak, nonatomic) IBOutlet UITextField *sexeTF;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;
@property (weak, nonatomic) IBOutlet UITextField *tailleTF;

@end

@implementation AddPersonViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickOnAddPersonToList:(id)sender {
    NSDictionary *newPerson = @{@"prenom":self.prenomTF.text, @"nom":self.nomTF.text, @"sexe":self.sexeTF.text, @"age":self.ageTF.text, @"taille":self.tailleTF.text};
    [self.delegate addPersonInViewController:self withDictionary:newPerson];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
