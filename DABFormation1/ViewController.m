//
//  ViewController.m
//  DABFormation1
//
//  Created by mac mini pprod 3 on 10/02/2016.
//  Copyright © 2016 mac mini pprod 3. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *prenomLabel;
@property (weak, nonatomic) IBOutlet UILabel *nomLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *tailleLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *personPickerView;


@property NSMutableArray *individusArray;

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.individusArray = [NSMutableArray arrayWithObjects:
                           @{@"prenom":@"Damien", @"nom":@"Bannerot",@"sexe":@"homme", @"age":@"23", @"taille":@"1m89"},
                           @{@"prenom":@"Elizabeth", @"nom":@"Windsor",@"sexe":@"femme", @"age":@"89", @"taille":@"1m62"},
                           @{@"prenom":@"Charles", @"nom":@"Dupont",@"sexe":@"homme", @"age":@"42", @"taille":@"1m76"},
                           @{@"prenom":@"Chuck", @"nom":@"Norris",@"sexe":@"homme", @"age":@"75", @"taille":@"1m77"},
                           @{@"prenom":@"Jesus", @"nom":@"Christ",@"sexe":@"homme", @"age":@"2016", @"taille":@"1m20"},
                           @{@"prenom":@"Gaben", @"nom":@"Newell",@"sexe":@"homme", @"age":@"53", @"taille":@"1m70"},
                           @{@"prenom":@"Emma", @"nom":@"Watson",@"sexe":@"femme", @"age":@"25", @"taille":@"1m65"},
                           nil];
    [self setIndividuWithDictionary:self.individusArray[0]];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    self.prenomLabel.text = [data[@"prenom"] isEqualToString:@""]?@"---":data[@"prenom"];
    self.nomLabel.text = [data[@"nom"] isEqualToString:@""]?@"---":data[@"nom"];
    self.ageLabel.text = [data[@"age"] isEqualToString:@""]?@"---":[NSString stringWithFormat:@"%@ ans", data[@"age"]];
    self.sexeLabel.text = [data[@"sexe"] isEqualToString:@""]?@"---":data[@"sexe"];
    self.tailleLabel.text = [data[@"taille"] isEqualToString:@""]?@"---":data[@"taille"];
}

-(void)setIndividuWithPerson:(Person *)person {
    self.prenomLabel.text = person.prenom;
    self.nomLabel.text = person.nom;
    self.ageLabel.text = [NSString stringWithFormat:@"%@ ans", person.age];
    self.sexeLabel.text = person.sexe;
    self.tailleLabel.text = person.taille;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ((AddPersonViewController *)segue.destinationViewController).delegate = self;
}

#pragma mark - UIPickerView Delegates

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.individusArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSDictionary *currentPerson = self.individusArray[row];
    NSString *fullName = [NSString stringWithFormat:@"%@ %@.", [currentPerson[@"nom"] isEqualToString:@""]?@"•••":currentPerson[@"nom"], [[currentPerson[@"prenom"] isEqualToString:@""]?@"•••":currentPerson[@"prenom"] substringToIndex:1]];
    return [NSString stringWithFormat:@"%ld - %@", (long)row, fullName];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self setIndividuWithDictionary:self.individusArray[row]];
}

#pragma mark - AddPersonViewController Delegates

- (void)addPersonInViewController:(AddPersonViewController *)viewController withDictionary:(NSDictionary *)personDictionary {
    [self.individusArray addObject:personDictionary];
    [self.personPickerView reloadAllComponents];
}

@end
