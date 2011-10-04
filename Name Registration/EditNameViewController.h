//
//  EditNameViewController.h
//  Name Registration
//
//  Created by Robério Vitória on 03/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Name_RegistrationAppDelegate;
@class Pessoa;

@interface EditNameViewController : UIViewController <UITextFieldDelegate>
{
    // Cria uma variável do tipo UITextField para ser ligada ao xib
    IBOutlet UITextField *textField;
    Name_RegistrationAppDelegate *appDelegate;
}

// Cria a variável -recebePessoa do tipo Pessoa- e suas propriedades(métodos getter e setter)
@property (nonatomic, retain) Pessoa *recebePessoa;;

- (void)doneAction:(id)sender;
- (void)cancelAction:(id)sender;

@end