//
//  Name_RegistrationAppDelegate.m
//  Name Registration
//
//  Created by Robério Vitória on 03/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Name_RegistrationAppDelegate.h"
#import "Pessoa.h"
#import "Name_RegistrationViewController.h"

@implementation Name_RegistrationAppDelegate

// Necessário para que o compilador possa criar os métodos getter e setter corretamente de pessoas
@synthesize pessoas;
// Necessário para que o compilador possa criar os métodos getter e setter corretamente de pessoaAtual
@synthesize pessoaAtual;
@synthesize window = _window;
@synthesize viewController = _viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Carrega as informações do Plist quando inicia o aplicativo
    [self loadData];

    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:self.viewController];

    [self.window setRootViewController:navigation];
    [self.window makeKeyAndVisible];
    [navigation release];
    return YES;
}

- (NSString *)pathForFileInPreferences:(NSString *)file
{
	NSString *documentDirectory = nil;
	documentDirectory = NSHomeDirectory();
	documentDirectory = [documentDirectory stringByAppendingPathComponent:@"Library"];
	documentDirectory = [documentDirectory stringByAppendingPathComponent:@"Preferences"];
	documentDirectory = [documentDirectory stringByAppendingPathComponent:file];
	return documentDirectory;
}

- (NSString *)pathForFileInDocuments:(NSString *)file
{
    NSString *documentDirectory = nil;
	documentDirectory = NSHomeDirectory();
	documentDirectory = [documentDirectory stringByAppendingPathComponent:@"Documents"];
	documentDirectory = [documentDirectory stringByAppendingPathComponent:file];
	return documentDirectory;
}

- (void)loadData
{
	NSString *nomePath = [self pathForFileInPreferences:@"Nomes.plist"];
    pessoas = [[NSKeyedUnarchiver unarchiveObjectWithFile:nomePath] retain];
    if ([pessoas count] < 1) {
		pessoas = [[NSMutableArray alloc] init];
    }   
}

- (void)saveData
{
	NSString *nomePath = [self pathForFileInPreferences:@"Nomes.plist"];
	[NSKeyedArchiver archiveRootObject:pessoas toFile:nomePath];
}

- (void)deleteName
{
    // Pega o NSMutableArray e apaga o nome que está selecionado
	[self.pessoas removeObject:self.pessoaAtual];	
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Quando o aplicativo fica inativo ele usa o método saveData
    [self saveData];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Antes do aplicativo terminar ele usa o método saveData
    [self saveData];
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [pessoas release];
    [super dealloc];
}

@end