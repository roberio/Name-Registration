//
//  Name_RegistrationViewController.h
//  Name Registration
//
//  Created by Robério Vitória on 03/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Pessoa;
@class Name_RegistrationAppDelegate;

@interface Name_RegistrationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    // Cria uma variável do tipo UITableView para ser ligada ao xib
    IBOutlet UITableView *tableView;
    Name_RegistrationAppDelegate *appDelegate;
}

// Declaração de método para adicionar um nome
- (void)addName:(id)sender;
// Declaração de método para editar um nome
- (void)editName:(id)sender;

@end
