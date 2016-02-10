//
//  ViewController.m
//  DABFormation1
//
//  Created by mac mini pprod 3 on 10/02/2016.
//  Copyright © 2016 mac mini pprod 3. All rights reserved.
//

#import "ViewController.h"
#import "Person+PersonAdditions.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *prenomLabel;
@property (weak, nonatomic) IBOutlet UILabel *nomLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *tailleLabel;
@property (weak, nonatomic) IBOutlet UITextField *numeroTextField;
@property (weak, nonatomic) IBOutlet UILabel *errorMessageLabel;

@property NSArray *individusArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.individusArray = [NSArray arrayWithObjects:
                           @{@"prenom":@"Damien", @"nom":@"Bannerot",@"sexe":@"homme", @"age":@"23", @"taille":@"1m89"},
                           @{@"prenom":@"Elizabeth", @"nom":@"Windsor",@"sexe":@"femme", @"age":@"89", @"taille":@"1m62"},
                           @{@"prenom":@"Charles", @"nom":@"Dupont",@"sexe":@"homme", @"age":@"42", @"taille":@"1m76"},
                           @{@"prenom":@"Chuck", @"nom":@"Norris",@"sexe":@"homme", @"age":@"75", @"taille":@"1m77"},
                           @{@"prenom":@"Jesus", @"nom":@"Christ",@"sexe":@"homme", @"age":@"2016", @"taille":@"1m20"},
                           @{@"prenom":@"Gaben", @"nom":@"Newell",@"sexe":@"homme", @"age":@"53", @"taille":@"1m70"},
                           @{@"prenom":@"Emma", @"nom":@"Watson",@"sexe":@"femme", @"age":@"25", @"taille":@"1m65"}, nil];
    
    //[self updateInterfaceWithIndividuIndex:3 andUsePersonClass:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateInterfaceWithIndividuIndex:(NSInteger)index andUsePersonClass:(BOOL)personClass {
    if(index < self.individusArray.count){
        self.errorMessageLabel.hidden = YES;
        NSDictionary *individu = self.individusArray[index];
        
        if(personClass) {
            Person *person = [Person new];
            person.nom = individu[@"nom"];
            person.prenom = individu[@"prenom"];
            person.sexe = individu[@"sexe"];
            person.age = individu[@"age"];
            person.taille = individu[@"taille"];
            if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isSwapOn"]){
                [person swapNomAndPrenom];
            }
            [self setIndividuWithPerson:person];
        }else{
            [self setIndividuWithDictionary:individu];
        }
    }else{
        [self setDefaultIndividu];
        self.errorMessageLabel.text = [NSString stringWithFormat:@"Il n'y a pas d'individu portant le numéro %ld.", (long)index];
        self.errorMessageLabel.hidden = NO;
    }
}

- (IBAction)clickOnUpdateButton:(id)sender {
    if([self.numeroTextField.text isEqualToString:@""]){
        [self setDefaultIndividu];
        self.errorMessageLabel.text = @"Veuillez remplir le champs texte.";
        self.errorMessageLabel.hidden = NO;
    }else{
        [self updateInterfaceWithIndividuIndex:[self.numeroTextField.text integerValue] andUsePersonClass:YES];
    }
}

- (IBAction)clickOnSwapButton:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:![[NSUserDefaults standardUserDefaults] boolForKey:@"isSwapOn"] forKey:@"isSwapOn"];
    [self clickOnUpdateButton:nil];
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.view endEditing:YES];
}

#pragma mark - Individu Delegates

- (void)setDefaultIndividu {
    self.prenomLabel.text = @"...";
    self.nomLabel.text = @"...";
    self.ageLabel.text = @"...";
    self.sexeLabel.text = @"...";
    self.tailleLabel.text = @"...";
}

-(void)setIndividuWithDictionary:(NSDictionary *)data {
    self.prenomLabel.text = data[@"prenom"];
    self.nomLabel.text = data[@"nom"];
    self.ageLabel.text = [NSString stringWithFormat:@"%@ ans", data[@"age"]];
    self.sexeLabel.text = data[@"sexe"];
    self.tailleLabel.text = data[@"taille"];
}

-(void)setIndividuWithPerson:(Person *)person {
    self.prenomLabel.text = person.prenom;
    self.nomLabel.text = person.nom;
    self.ageLabel.text = [NSString stringWithFormat:@"%@ ans", person.age];
    self.sexeLabel.text = person.sexe;
    self.tailleLabel.text = person.taille;
}

@end
