//
//  Name_RegistrationAppDelegate.h
//  Name Registration
//
//  Created by Robério Vitória on 03/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Pessoa;

@class Name_RegistrationViewController;

@interface Name_RegistrationAppDelegate : NSObject <UIApplicationDelegate>
{
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Name_RegistrationViewController *viewController;
// Cria a variável -pessoas do tipo NSMutableArray- e suas propriedades(métodos getter e setter)
@property (nonatomic, retain) NSMutableArray *pessoas;
// Cria a variável -pessoaAtual do tipo Pessoa- e suas propriedades(métodos getter e setter)
@property (nonatomic, retain) Pessoa *pessoaAtual;

// Método para carregar os dados apartir do Plist
- (void)loadData;
// Método para salvar os dados no Plist
- (void)saveData;
// Método para deletar os dados do Plist
- (void)deleteName;

- (NSString *)pathForFileInPreferences:(NSString *)file;
- (NSString *)pathForFileInDocuments:(NSString *)file;

@end