//
//  SettingsViewController.m
//  tipcal
//
//  Created by Rakhesh on 12/29/13.
//  Copyright (c) 2013 Rakhesh. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *option1Text;
@property (weak, nonatomic) IBOutlet UITextField *Option2Text;
@property (weak, nonatomic) IBOutlet UITextField *Option3Text;
@property (weak, nonatomic) IBOutlet UIButton *SubmitChanges;

- (IBAction)onTapOnSettings:(id)sender;
- (IBAction)SaveChanges:(id)sender;

//- (void) onSettingsButton;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"i0s7-purple-1.jpg"]];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float tipOpt1 = [defaults floatForKey:@"tipOpt1"];
    float tipOpt2 = [defaults floatForKey:@"tipOpt2"];
    float tipOpt3 = [defaults floatForKey:@"tipOpt3"];
    
    self.option1Text.text = [NSString stringWithFormat:@"%0.2f",tipOpt1];
    self.Option2Text.text = [NSString stringWithFormat:@"%0.2f",tipOpt2];
    self.Option3Text.text = [NSString stringWithFormat:@"%0.2f",tipOpt3];
    
 
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)onSettingsButton {
//    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
//}


- (IBAction)submitChanges:(id)sender {
    NSLog(@"submit called");
    
    
}

- (IBAction)onTapOnSettings:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)SaveChanges:(id)sender {
    NSLog(@"Save called");

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    float option1Value = [self.option1Text.text floatValue];
    option1Value = (option1Value > 0) ? option1Value : 10.0;
    [defaults setFloat:option1Value forKey:@"tipOpt1"];
    
    float option2Value = [self.Option2Text.text floatValue];
    option2Value = (option2Value > 0) ? option2Value : 15.0;
    [defaults setFloat:option2Value forKey:@"tipOpt2"];
  
    float option3Value = [self.Option3Text.text floatValue];
    option3Value = (option3Value > 0) ? option3Value : 20.0;
    [defaults setFloat:option3Value forKey:@"tipOpt3"];
    
    NSLog([NSString stringWithFormat: @"option 1 value %f",option1Value]);
    NSLog([NSString stringWithFormat: @"option 2 value %f",option2Value]);
    NSLog([NSString stringWithFormat: @"option 3 value %f",option3Value]);
    
    [defaults synchronize];
}
@end
