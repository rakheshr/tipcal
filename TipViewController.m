//
//  TipViewController.m
//  tipcal
//
//  Created by Rakhesh on 12/28/13.
//  Copyright (c) 2013 Rakhesh. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
{
    
}
@property (weak, nonatomic) IBOutlet UITextField *billAmountText;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTap:(id)sender;
- (void) updateValues;
- (void) onSettingsButton;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"i0s7-purple-1.jpg"]];
    return self;
}

- (void)fetchUserDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float tipOpt1 =  [defaults floatForKey:@"tipOpt1"];
    tipOpt1 = (tipOpt1 > 0) ? tipOpt1 : 10.0;
    float tipOpt2 = [defaults floatForKey:@"tipOpt2"];
    tipOpt2  = (tipOpt2 > 0 ) ? tipOpt2 : 15.0;
    float tipOpt3 = [defaults floatForKey:@"tipOpt3"];
    tipOpt3 = (tipOpt3 > 0 ) ? tipOpt3 : 20.0;
    
    [self.tipControl setTitle:[NSString stringWithFormat:@"%0.2f", tipOpt1 ] forSegmentAtIndex:0];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%0.2f", tipOpt2 ] forSegmentAtIndex:1];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%0.2f", tipOpt3 ] forSegmentAtIndex:2];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    
    
 NSLog(@"view did load");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues{

    float billAmt = [self.billAmountText.text floatValue];
    //NSArray *tipValues = @[@(0.10), @(0.15), @(0.20)];
    //float tipAmt = billAmt * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    //NSString *titleValue = [self.tipControl titleForSegmentAtIndex:self.tipControl.selectedSegmentIndex ];
    //float tipAmt = billAmt * [self.tipControl titleForSegmentAtIndex:[self.tipControl.selectedSegmentIndex]floatValue];

    float selPercentage = [[self.tipControl titleForSegmentAtIndex:self.tipControl.selectedSegmentIndex ] floatValue] /100;
    float tipAmt = billAmt * selPercentage;
    float totalAmt = billAmt + tipAmt;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"%0.2f", tipAmt ];
    self.totalAmountLabel.text = [NSString stringWithFormat:@"%0.2f", totalAmt];
    
    NSLog(@"Calling updateValues");
    
}

- (void)onSettingsButton
{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
    [self fetchUserDefaults];
    [self updateValues];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

@end
